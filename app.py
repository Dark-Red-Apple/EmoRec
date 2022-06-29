# import os

from flask import Flask
from flask import render_template, request
# # from currency_converter import CurrencyConverter
import nltk
from nltk.corpus import stopwords
from transformers import AutoTokenizer, TFDistilBertForSequenceClassification
import string
nltk.download("stopwords")
# # import matplotlib.pyplot as plt

model = TFDistilBertForSequenceClassification.from_pretrained("/saved_model")
# tokenizer = AutoTokenizer.from_pretrained("distilbert-base-uncased")
# try:    

# except Exception as e:
#     print(e)



app = Flask(__name__)


@app.route("/")
def form():
    return render_template("form.html")
    # return


@app.route("/", methods=["POST"])
def my_form_post():
    # c = CurrencyConverter()
    # print("Output" + request.form["sentence_input"])
    input_ids = tokenizer(request.form["sentence_input"], return_tensors='tf')
    tokens = tokenizer.convert_ids_to_tokens(input_ids['input_ids'][0])
    preds = model(input_ids)
    sentiment = model.config.id2label[preds[0][0].numpy().argmax()]

    stwrds = stopwords.words('english')
    filtered_words = [word for word in tokens if word not in [
    '[CLS]', '[SEP]', stwrds, string.punctuation, string.digits, '.']]
    freq = nltk.FreqDist(filtered_words)
    new_set = [(sub, val) for sub, val in freq.items() if val > 1]
    top = freq.most_common(4)

    for sub, val in new_set:
        tokens = [word if word != sub else '<b>' + word + '</b>' for word in tokens]
    # usd = round(c.convert(euros, "EUR", "USD"), 2)

    new_text = tokenizer.convert_tokens_to_string(tokens)
    new_text = new_text.replace('[CLS]', '').replace('[SEP]', '')

    return render_template("form.html", sentiment=sentiment, new_text=new_text, top=top)


if __name__ == "__main__":
    app.run(debug=True)

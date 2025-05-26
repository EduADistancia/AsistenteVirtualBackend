import os
import random
import json
import pickle

import numpy as np
import nltk
from nltk.stem import WordNetLemmatizer
from tensorflow.keras.models import load_model


lemmatizer = WordNetLemmatizer()

BASE_DIR = os.path.dirname(os.path.abspath(__file__))

intents = json.loads(open(os.path.join(BASE_DIR, 'intents.json'), 'r', encoding='utf-8').read())
words = pickle.load(open(os.path.join(BASE_DIR, 'words.pkl'), 'rb'))
classes = pickle.load(open(os.path.join(BASE_DIR, 'classes.pkl'), 'rb'))
model = load_model(os.path.join(BASE_DIR, 'chatbot_model.h5'))


def clean_up_sentence(sentence):
    sentence_words = nltk.word_tokenize(sentence)
    sentence_words = [lemmatizer.lemmatize(word.lower()) for word in sentence_words]
    
    return sentence_words

def bags_of_words(sentence):
    sentence_words = clean_up_sentence(sentence)
    bag = [0] * len(words)
    
    for w in sentence_words:
        for i, word in enumerate(words):
            if word == w:
                bag[i] = 1
                
    return np.array(bag)

def predict_class(sentence):
    bow = bags_of_words(sentence)
    res = model.predict(np.array([bow]))[0]
    ERROR_THRESHOLD = 0.25
    results = [[i, r] for i, r in enumerate(res) if r > ERROR_THRESHOLD]
    results.sort(key=lambda x: x[1], reverse=True)
    return_list = []
    
    for r in results:
        return_list.append({'intent': classes[r[0]], 'probability': str(r[1])})
        
    return return_list

def get_response_with_related_intents(intents_list, intents_json):
    if not intents_list:
        return {
            "response": "Lo siento, no entendí tu mensaje.",
            "related_intents": []
        }

    tag = intents_list[0]['intent']
    list_of_intents = intents_json['intents']

    for intent in list_of_intents:
        if intent['tag'] == tag:
            response = random.choice(intent['responses'])
            related_intents = get_related_intents(tag, intents_json)
            return {
                "response": response,
                "related_intents": related_intents
            }

    return {
        "response": "Lo siento, no entendí tu mensaje.",
        "related_intents": []
    }


def get_related_intents(current_tag, intents_json, max_related=3):
    related = []

    for intent in intents_json['intents']:
        if intent['tag'] != current_tag and \
           intent['tag'] != "saludo" and \
           intent['tag'] != "agradecimiento" and \
           intent['tag'] != "desconocido":
            related.append({
                "tag": intent['tag'],
                "patterns": intent['patterns'][:2]
            })

    # Barajamos y seleccionamos algunos relacionados
    random.shuffle(related)
    return related[:max_related]
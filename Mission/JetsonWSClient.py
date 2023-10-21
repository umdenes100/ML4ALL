# WARNING STUDENTS - IF YOU EDIT THIS FILE THINGS MAY NOT WORK. WE WILL NOT HELP YOU DEBUG ERRORS CAUSED BY EDITING THIS FILE.
# If you choose to edit it, save a copy first of the pre-edited state.

import websocket
import json
import os
import PIL.Image
import numpy as np
import io
import cv2
from utils import preprocess, Hex_RGB

class JetsonClient:
    # See first line of this file if you want to edit this function
    def on_message(self, _, message):
        #print(message)
        message = json.loads(message)
        if message['op'] == 'prediction_request':
            #losBytes = bytes.fromhex(message['image'])
            print('entering preprocess')
            dsbytes = []
            print(message['image'])
            for i in range(0,len(message['image']),2):
                tens = message['image'][i]
                ones = message['image'][i+1]
                tot = tens + ones
                print(tot)
                dsbytes.append(Hex_RGB(tot))
            #deserialized_bytes = np.frombuffer(losBytes, dtype=np.int8)
            #deserialized_x = np.reshape(deserialized_bytes, newshape=(224, 224))
            #preprocessed = preprocess(deserialized_bytes)
            print(dsbytes)
            print('entering handler')
            results = self.handler(dsbytes)
            print('sending')
            self.ws.send(json.dumps({
                "op": "prediction_results",
                "prediction": results
            }))
            print('sent :)')
        '''
        if message['op'] == 'image_capture':
            losBytes = bytes.fromhex(message['image'])
            print('entering preprocess')
            image_str = io.BytesIO(losBytes)
            #image_str = PIL.Image.frombytes(data=image_str,mode='RGB',size=(224,224),decoder_name='jpeg')
            picture = PIL.Image.open(image_str)
            if not os.path.isdir('./data/' + message['category']):
                os.mkdir('./data/' + message['category'])
            i = 0
            while os.path.exists('./data/' + message['category'] + '/im' + str(i) + '.jpeg'):
                i += 1
            picture.save('./data/' + message['category'] + '/im' + str(i) + '.jpeg','JPEG')
            print('saved :)')
        '''
    # See first line of this file if you want to edit this function
    def on_open(self, _):
        print("Opened!")
        self.ws.send(json.dumps({
            "op": "begin",
            "teamName": self.team_name
        }))
           
    def on_error(self, _, error):
        print(error)
        
    # See first line of this file if you want to edit this function
    def __init__(self, handler, team_name):
        self.team_name = team_name
        self.handler = handler
        # websocket.enableTrace(True)
        self.ws = websocket.WebSocketApp("ws://192.168.1.2:7756", on_message=self.on_message, on_open=self.on_open, on_error=self.on_error)

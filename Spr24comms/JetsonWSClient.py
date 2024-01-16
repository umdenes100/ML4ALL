import websocket
import json
import os
import PIL.Image
import numpy as np
import io
import cv2

class NpEncoder(json.JSONEncoder):
    def default(self, obj):
        if isinstance(obj, np.integer):
            return int(obj)
        if isinstance(obj, np.floating):
            return float(obj)
        if isinstance(obj, np.ndarray):
            return obj.tolist()
        return super(NpEncoder, self).default(obj)

import torch
import torchvision.transforms as transforms
import torch.nn.functional as F
from utils import preprocess

mean = torch.Tensor([0.485, 0.456, 0.406]).cuda()
std = torch.Tensor([0.229, 0.224, 0.225]).cuda()

class JetsonClient:
    # See first line of this file if you want to edit this function
    def on_message(self, _, message):
        print(message)
        message = json.loads(message)
        if message['op'] == 'prediction_request':
            IP = message['ESPIP'][0]
            print(IP)
            cap = cv2.VideoCapture('http://' + IP + ":81/stream")
            if cap.isOpened():
                print("captured")
                ret, frame = cap.read()
            else:
                print("failed capture")
                self.ws.send(json.dumps({
                    "op": "prediction_results",
                    "prediction": -99
                },cls=NpEncoder))
                return
            
            try:
                cv2.imwrite('imcurr.jpg', frame)
            except:
                print('failed to save image :(')
            
            print('entering preprocess...')
            picture = preprocess(frame)
            results = self.handler(picture)
            print(results)
            print('sending')
            self.ws.send(json.dumps({
                "op": "prediction_results",
                "prediction": results
            },cls=NpEncoder))
            print('sent :)')

    # See first line of this file if you want to edit this function
    def on_open(self, _):
        print("Opened!")
        self.ws.send(json.dumps({
            "op": "begin",
            "jetson_id": self.jetson_id
        }))
           
    def on_error(self, _, error):
        print(error)
        
    # See first line of this file if you want to edit this function
    def __init__(self, handler, id)
        self.jetson_id = str(id)
        self.handler = handler
        # websocket.enableTrace(True)
        self.ws = websocket.WebSocketApp("ws://192.168.1.2:7756", on_message=self.on_message, on_open=self.on_open, on_error=self.on_error)

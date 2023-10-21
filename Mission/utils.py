import torch
import torchvision.transforms as transforms
import torch.nn.functional as F
import cv2
import PIL.Image
import numpy as np

mean = torch.Tensor([0.485, 0.456, 0.406]).cuda()
std = torch.Tensor([0.229, 0.224, 0.225]).cuda()
#transform = transforms.Compose([transforms.ToTensor(), transforms.Normalize([0.5], [0.5])])
#transform = transforms.Compose([transforms.ToTensor(), transforms.Normalize((0.5,), (0.5,))])

def preprocess(image):
    device = torch.device('cuda')
    image = PIL.Image.fromarray(image)
    #image = transform(image)
    image = transforms.functional.to_tensor(image).to(device)
    image.sub_(mean[:, None, None]).div_(std[:, None, None])
    return image[None, ...]

def Hex_RGB(ip):
    return tuple(int(ip[i:i+2],16) for i in (0, 2, 4))
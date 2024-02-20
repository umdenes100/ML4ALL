import torch
import torchvision
import torch.nn.functional as F
import JetsonWSClient
import os

def handler(image, team_name):
    print('handling...')
    model_fi = ""
    for entry in os.scandir('/nvdli-nano/model-listener/models/'):
        if entry.name.lower().startswith(team_name.lower()):
            model_fi = entry.name
            break
    if model_fi == "":
        return -83
    
    print(model_fi)
    num_str = model_fi.split('_')[-1]
    num_str = os.path.splitext(num_str)[0]
    print(num_str)
    dim = int(num_str)
    
    # TODO figure out what of these can be declared outisde of the handler possibly
    # device = torch.device('cuda')
    # model = torchvision.models.resnet18(pretrained=True)
    # model.fc = torch.nn.Linear(512, dim)
    # model = model.to(device)
    # model.load_state_dict(torch.load('/model-listener/models/' + model_fi))
    # model.eval()
    # output = model(image)
    # output = F.softmax(output, dim=1).detach().cpu().numpy().flatten()
    # for i, score in enumerate(list(output)):
    #     print(str(i) + " " + str(score))
    # return output.argmax()
    return 123


client = JetsonWSClient.JetsonClient(handler, 150)
client.ws.run_forever()

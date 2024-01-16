import torch
import torchvision
import torch.nn.functional as F
import JetsonWSClient

def handler(image):
    device = torch.device('cuda')
    model = torchvision.models.resnet18(pretrained=True)
    model.fc = torch.nn.Linear(512, 2) # TODO get the output dim from db
    model = model.to(device)
    model.load_state_dict(torch.load(team_name + '.pth')) # TODO change this to correct path
    model.eval()
    output = model(image)
    output = F.softmax(output, dim=1).detach().cpu().numpy().flatten()
    for i, score in enumerate(list(output)):
        print(str(i) + " " + str(score))
    return output.argmax()


client = JetsonWSClient.JetsonClient(handler, 150)
client.ws.run_forever()

import torch
import torchvision
import torch.nn.functional as F
import JetsonWSClient

print('setup...')
categories = ['orzo', 'rocks']
device = torch.device('cuda')
model = torchvision.models.resnet18(pretrained=True)
model.fc = torch.nn.Linear(512, len(categories))
model = model.to(device)
state_dict = torch.load('we_ball.pth')
model.load_state_dict(state_dict)
print('setup complete!')

def handler(image):
    with torch.no_grad():
        model.eval()
        result = model(image)
    output = F.softmax(result, dim=1).detach().cpu().numpy().flatten()
    for i, score in enumerate(list(output)):
        print(str(i) + " " + str(score))
    print(categories[output.argmax()])
    return output.argmax()

client = JetsonWSClient.JetsonClient(handler, 'Team Name')
client.ws.run_forever()

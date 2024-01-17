import torch
import torchvision
import torch.nn.functional as F
import JetsonWSClient

print('setup...')
categories = ['orzo', 'rocks']
device = torch.device('cuda')

model1 = torchvision.models.resnet18(pretrained=True)
model1.fc = torch.nn.Linear(512, 2)
model1 = model1.to(device)
model1.load_state_dict(torch.load('model1.pth'))
model1.eval()

model2 = torchvision.models.resnet18(pretrained=True)
model2.fc = torch.nn.Linear(512, 2)
model2 = model2.to(device)
model2.load_state_dict(torch.load('model2.pth'))
model2.eval()

print('setup complete!')

prediction_counter = 0

def handler(image):
    if prediction_counter == 0:
        output = model1(image)
        prediction_counter += 1
    else:
        output = model2(image)

    output = F.softmax(output, dim=1).detach().cpu().numpy().flatten()
    for i, score in enumerate(list(output)):
        print(str(i) + " " + str(score))
    print(categories[output.argmax()])
    return output.argmax()


client = JetsonWSClient.JetsonClient(handler, 'Team Swag')
client.ws.run_forever()

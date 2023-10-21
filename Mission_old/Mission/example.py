import torch
import torchvision
import torch.nn.functional as F
import JetsonWSClient

print('setup...')
categories = ['rocks', 'orzo']
device = torch.device('cuda')
model = torchvision.models.resnet18(pretrained=True)
model.fc = torch.nn.Linear(512, 2)
model = model.to(device)
model.load_state_dict(torch.load('we_ball.pth'))
model.eval()
print('setup complete!')


def handler(image):
    with torch.no_grad():
        model.eval()
        output = model(image)
    output = F.softmax(output, dim=1).detach().cpu().numpy().flatten()
    for i, score in enumerate(list(output)):
        print(str(i) + " " + str(score))
    print(categories[output.argmax()])
    return output.argmax()


client = JetsonWSClient.JetsonClient(handler, 'Team Name')
client.ws.run_forever()

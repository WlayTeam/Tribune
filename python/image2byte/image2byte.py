from PIL import Image 

image_name = 'stayreal.jpeg'
img = Image.open(image_name)

img = img.convert('L')

#print(img.mode)
#img.save('lixing.jpg')
#显示图片
#img.show()

#缩小图片
w,h = img.size
if w>100:
    h = int((100/w)*h/2)
    w = 100
img = img.resize((w,h),Image.ANTIALIAS)
img.show()
#保存像素字符的列表
data = []
#替换字符串颜色逐渐加深
chars = [' ',',','1','+','n','D','@','M']
#每个像素点的值
#print(img.getpixel((50,35)))

for i in range(0,h):
    line = ''
    for j in range(0,w):
        #取出像素点的值
        pi = img.getpixel((j,i))

        for k in range(0,8):
            if pi < (k+1)*32:
                line += chars[7-k]
                break
    data.append(line)

file = open(image_name+'.txt','w')
for d in data:
    print(d)
    print(d,file=file)
file.close()
print("转化成功")

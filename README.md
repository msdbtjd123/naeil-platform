Easy Pipo
"Pipo Painting" Auto Creation System
Using Image Processing, the real image is automatically converted to a "Pipo Painting" canvas.


Our Icon
logo


📌 Name : Easy Pipo

📌 Authors : Minku Koo  Jiyong Park

📌 Development Period : Feb.2021 ~ Jun.2021

📌 Main Library : OpenCV, numpy, Flask

📌 Keyword : "Computer Vision", "Image Processing", "OpenCV", "Pipo Painting", "Line Detection", "Color Numbering"


📃 Table of Contents
Introduction
What is Pipo Painting?
How to Use?
SW Architecture
Working Process
Original Image
Step 1
Step 2
Step 3
Modules Development
Painting()
DrawLine()
Numbering()
Contact to us
🤔 What is Pipo Painting?
pipopainting-example

"Pipo Painting" is also called "Paint by Number" or "Painting by Numbers".
It is a kit having a board on which light markings to indicate areas to paint, and each area has a number and a corresponding numbered paint to use. The kits come with little compartmentalised boxes where the numbered colour pigments are stored. The users are encouraged to wash the paintbrush every time a new numbered colour is being used.

🔗 Wikipedia Discription
🔗 Amazon Products
🔗 Coupang Products

⚙ How to Use?
Command Line
git clone https://github.com/AutoPipo/EasyPipo.git
cd EasyPipo
pip install -r requirements.txt
python .
On your Web Browser
https://localhost:5000
🖥 SW Architecture
sw-architecture

💡 Working Process
Original Image
original

Step 1. Color Clustering (8, 16, 32 Colors)
8 colors 16 colors 32 colors

Step 2. Select appropriate number of colors and Line Drawing
line drawing

Step 3. Remove noise line and Set Color Numbering (Color Label Included or Not)
numbering+label numbering+non_label

🔎 If it zoom in, you can see numbers
numbering-expand

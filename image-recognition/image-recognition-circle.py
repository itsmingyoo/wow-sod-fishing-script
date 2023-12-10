import cv2
import numpy as np
from matplotlib import pyplot as plt

# Load image
img = cv2.imread("image.jpg")
gray = cv2.cvtColor(img, cv2.COLOR_BGR2GRAY)

# Apply GaussianBlur to reduce noise
gray_blurred = cv2.GaussianBlur(gray, (15, 15), 0)

# Use Hough Circle Transform for circle detection
circles = cv2.HoughCircles(
    gray_blurred,
    cv2.HOUGH_GRADIENT,
    dp=1,
    minDist=50,
    param1=30,
    param2=15,
    minRadius=5,
    maxRadius=50,
)

if circles is not None:
    circles = np.uint16(np.around(circles))
    for circle in circles[0, :]:
        center = (circle[0], circle[1])
        radius = circle[2]

        # Draw the circle on the original image
        cv2.circle(img, center, radius, (0, 255, 0), 5)

# Show the image
plt.imshow(cv2.cvtColor(img, cv2.COLOR_BGR2RGB))
plt.axis("off")
plt.show()

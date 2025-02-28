import cv2
import pytesseract
from PIL import ImageGrab
import numpy as np
import time

# Set the path to the Tesseract executable (if not in PATH)
pytesseract.pytesseract.tesseract_cmd = r'C:\Program Files\Tesseract-OCR\tesseract.exe'

def ocr_selected_window(x, y, w, h):
    # Capture the screen region
    screenshot = np.array(ImageGrab.grab(bbox=(x, y, x+w, y+h)))
    screenshot = cv2.cvtColor(screenshot, cv2.COLOR_RGB2BGR)
    
    # Image preprocessing (optional)
    gray_image = cv2.cvtColor(screenshot, cv2.COLOR_BGR2GRAY)
    _, processed_image = cv2.threshold(gray_image, 150, 255, cv2.THRESH_BINARY)
    
    # Perform OCR
    text = pytesseract.image_to_string(processed_image)
    return text

if __name__ == "__main__":
    # Define the region coordinates (x, y, width, height)
    x, y, w, h = 100, 100, 300, 100
    
    # Perform OCR and print the result
    extracted_text = ocr_selected_window(x, y, w, h)
    print("Extracted Text:")
    print(extracted_text)

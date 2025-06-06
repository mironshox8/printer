from fastapi import FastAPI, HTTPException
import uvicorn
import time
import subprocess
import pyautogui
import os
from PIL import Image, ImageDraw, ImageFont, ImageEnhance
import qrcode
import mysql.connector

app = FastAPI()

@app.get("/print-check")
async def print_check():
    try:
        # MySQL ulanish
        db = mysql.connector.connect(
            host="localhost",
            user="root",
            password="",
            database="chek_baza"
        )
        cursor = db.cursor()
        cursor.execute("SELECT nomi, narxi, miqdori FROM mahsulotlar LIMIT 1")  # faqat 1 ta mahsulot olamiz
        row = cursor.fetchone()
        sabzavot_nom, narx, miqdor = row
        jami_narx = (narx * miqdor)

        # Chekni yaratish
        receipt_width = 180
        receipt_height = 300
        receipt = Image.new('RGB', (receipt_width, receipt_height), 'white')
        draw = ImageDraw.Draw(receipt)

        # Logotip
        logo = Image.open(r"C:\Users\308 2\Documents\OSPanel\domains\qr\agent.png")
        logo = logo.resize((100, 45), Image.LANCZOS)
        receipt.paste(logo, (35, 5))

        # Matnlar
        font = ImageFont.load_default()
        draw.text((10, 60), f"Nomi: {sabzavot_nom}", fill='black', font=font)
        draw.text((10, 90), f"Narxi: {narx:.2f} so'm", fill='black', font=font)
        draw.text((10, 120), f"Miqdori: {miqdor:.2f}", fill='black', font=font)
        draw.text((10, 150), f"Jami: {jami_narx:.2f} so'm", fill='black', font=font)

        # QR kod
        qr = qrcode.QRCode(version=1, box_size=10, border=4)
        qr.add_data(f"{sabzavot_nom} - {jami_narx:.2f} so'm")
        qr.make(fit=True)
        qr_img = qr.make_image(fill_color="black", back_color="white")
        qr_img = qr_img.resize((100, 100), Image.LANCZOS)
        receipt.paste(qr_img, (35, 180))

        # Pastki matn
        draw.text((24, 270), "XARIDINGIZ UCHUN RAHMAT", fill='blue', font=font)

        # Ramka
        def add_border(image, border_size=3, border_color="black"):
            width, height = image.size
            new_width = width + 2 * border_size
            new_height = height + 2 * border_size
            bordered_image = Image.new("RGB", (new_width, new_height), border_color)
            bordered_image.paste(image, (border_size, border_size))
            return bordered_image

        # Rasmni yaxshilash va saqlash
        receipt_with_border = add_border(receipt)
        enhancer = ImageEnhance.Contrast(receipt_with_border)
        receipt_with_border = enhancer.enhance(1.2)
        receipt_with_border.save("chek.png", quality=95)
        receipt_with_border.show()

        # Fayl yo'lini tekshirish
        image_path = r"C:\Users\308 2\Documents\OSPanel\domains\printer\chek.png"
        if not os.path.exists(image_path):
            raise HTTPException(status_code=404, detail="Fayl topilmadi")

        # Paint dasturida faylni ochish
        subprocess.Popen(['mspaint.exe', image_path])

        # Kutish
        time.sleep(2)

        # Chop qilish kombinatsiyasi
        pyautogui.hotkey('ctrl', 'p')
        time.sleep(1)
        pyautogui.press('enter')
        time.sleep(1)
        pyautogui.hotkey('alt', 'f4')

        return {"status": "success", "message": "Chop qilish buyrug'i yuborildi"}

    except Exception as e:
        raise HTTPException(status_code=500, detail=str(e))

if __name__ == "__main__":
    uvicorn.run(app, host="0.0.0.0", port=8000)

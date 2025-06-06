<?php
// FastAPI server manzili
$api_url = "http://localhost:8000/print-check";

// So'rov yuborish
$ch = curl_init($api_url);
curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
$response = curl_exec($ch);
$http_code = curl_getinfo($ch, CURLINFO_HTTP_CODE);
curl_close($ch);

// Javobni qayta ishlash
if ($http_code == 200) {
    $result = json_decode($response, true);
    echo "<div style='text-align: center; margin-top: 50px;'>
            <h2>Chop qilish muvaffaqiyatli amalga oshirildi!</h2>
            <p>{$result['message']}</p>
          </div>";
} else {
    $error = json_decode($response, true);
    echo "<div style='text-align: center; margin-top: 50px; color: red;'>
            <h2>Xatolik yuz berdi!</h2>
            <p>{$error['detail']}</p>
          </div>";
}
?>
package controller;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.*;
import java.net.HttpURLConnection;
import java.net.URL;

@WebServlet("/chatbot")
public class ChatbotServlet extends HttpServlet {

    private static final String API_KEY = "";// 👉 nhớ thay lại

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");

        String message = request.getParameter("message");

        URL url = new URL("https://api.groq.com/openai/v1/chat/completions");
        HttpURLConnection conn = (HttpURLConnection) url.openConnection();

        conn.setRequestMethod("POST");
        conn.setRequestProperty("Authorization", "Bearer " + API_KEY);
        conn.setRequestProperty("Content-Type", "application/json");
        conn.setDoOutput(true);

        // ✅ tránh lỗi khi user nhập dấu "
        message = message.replace("\"", "\\\"");

        String jsonInput = "{"
                + "\"model\":\"llama-3.1-8b-instant\","
                + "\"messages\":["
                + "{\"role\":\"system\",\"content\":\"You are a LEGO shop assistant. "
                + "ONLY recommend products that exist in our store. "
                + "Available products are: "
                + "Lego SpeedChampions Ferrari SF90 (500000 VND), "
                + "Lego SpeedChampions Porsche 963 (500000 VND), "
                + "Lego SpeedChampions F1 RedBull RB20 (440000 VND), "
                + "Lego SpeedChampions F1 Ferrari SF24 (450000 VND), "
                + "Lego SpeedChampions Porsche 911 GT3 RS (600000 VND), "
                + "Lego Ferrari F40 (600000 VND), "
                + "Lego SpeedChampions Nissan R34 GTR (500000 VND), "
                + "Lego SpeedChampions McLaren W1 (650000 VND). "
                + "Do NOT create fake products, fake prices, or fake set codes. "
                + "If customer asks for unavailable products, politely tell them to check available items on our website. "
                + "Always reply in English, friendly and concise.\"},"

                + "{\"role\":\"user\",\"content\":\"" + message + "\"}"
                + "]"
                + "}";

        try (OutputStream os = conn.getOutputStream()) {
            os.write(jsonInput.getBytes("utf-8"));
        }

        BufferedReader br;

        if (conn.getResponseCode() >= 200 && conn.getResponseCode() < 300) {
            br = new BufferedReader(new InputStreamReader(conn.getInputStream(), "utf-8"));
        } else {
            br = new BufferedReader(new InputStreamReader(conn.getErrorStream(), "utf-8"));
        }

        StringBuilder responseStr = new StringBuilder();
        String line;

        while ((line = br.readLine()) != null) {
            responseStr.append(line);
        }

        String json = responseStr.toString();
        System.out.println("RAW RESPONSE: " + json); // debug

        // ✅ parse an toàn hơn
        String reply = "Chatbot error";

        try {
            String key = "\"content\":\"";
            int start = json.indexOf(key);

            if (start != -1) {
                start += key.length();
                int end = json.indexOf("\"", start);
                reply = json.substring(start, end);

                // fix escape
                reply = reply.replace("\\n", " ")
                        .replace("\\\"", "\"");
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        response.setContentType("application/json;charset=UTF-8");
        response.getWriter().write("{\"reply\":\"" + reply.replace("\"", "'") + "\"}");
    }
}
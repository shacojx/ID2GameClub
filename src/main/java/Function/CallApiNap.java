/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Function;

import okhttp3.MediaType;
import okhttp3.OkHttpClient;
import okhttp3.Request;
import okhttp3.RequestBody;
import okhttp3.Response;

/**
 *
 * @author Admin
 */
public class CallApiNap {

    public static OkHttpClient client = new OkHttpClient().newBuilder()
            .build();

    public void nap(int amount, String cardtype, String seri, String mathe) {
        try {
            String host = "https://xxx.com/partner/RequestPayment";
            String signature = "65ddceda0b55f270bdd4bef1dd04925c";
            String transid = "xxxx";
            String apiToken = "xxx";
            String urlCallBack = "xxx";

            MediaType mediaType = MediaType.parse("application/x-www-form-urlencoded");
            RequestBody body = RequestBody.create(mediaType, "CardSeri=" + seri + "&CardCode=" + mathe + "&Amount=" + amount + "&Signature=" + signature + "&TransID=" + transid + "&CardType=" + cardtype + "&ApiToken=" + apiToken + "&UrlCallBack=" + urlCallBack);
            Request request = new Request.Builder()
                    .url(host)
                    .method("POST", body)
                    .addHeader("Content-Type", "application/x-www-form-urlencoded")
                    .build();
            Response response = client.newCall(request).execute();
            String output = response.body().string();
            if (output.contains("\"errorCode\": 0")) {
                //gui the thanh cong
            } else {
                //gui the that bai noi dung that bai

            }
        } catch (Exception ex) {
            ex.printStackTrace();
        }
    }

}

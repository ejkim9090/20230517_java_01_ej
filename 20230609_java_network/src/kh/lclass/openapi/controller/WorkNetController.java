package kh.lclass.openapi.controller;

import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;

import kh.lclass.openapi.model.service.EvInfoService;
import kh.lclass.openapi.run.EvInfoRun;

import java.io.BufferedReader;
import java.io.IOException;

public class WorkNetController{

	 public static void main(String[] args) throws IOException {
		 StringBuilder urlBuilder = new StringBuilder("http://openapi.work.go.kr/opi/opi/opia/wantedApi.do"); /*URL*/
	        urlBuilder.append("?" + URLEncoder.encode("authKey","UTF-8") + "=WNLBET6R0WPQK95R8VLU02VR1HJ"); /*Service Key*/
	        urlBuilder.append("&" + URLEncoder.encode("returnType","UTF-8") + "=" + URLEncoder.encode("xml", "UTF-8")); /*결과형식(xml)*/
	        urlBuilder.append("&" + URLEncoder.encode("callTp","UTF-8") + "=" + URLEncoder.encode("L", "UTF-8")); /*L(목록), D(상세)*/
	        urlBuilder.append("&" + URLEncoder.encode("startPage","UTF-8") + "=" + URLEncoder.encode("3", "UTF-8")); /*페이지번호 - 수정4!!*/
	        urlBuilder.append("&" + URLEncoder.encode("display","UTF-8") + "=" + URLEncoder.encode("10", "UTF-8")); /*한 페이지 결과 수*/
//	        urlBuilder.append("&" + URLEncoder.encode("region","UTF-8") + "=" + URLEncoder.encode("11000", "UTF-8")); /*지역-서울*/
	        urlBuilder.append("&" + URLEncoder.encode("region","UTF-8") + "=" + URLEncoder.encode("41000", "UTF-8")); /*지역-경기*/
//	        urlBuilder.append("&" + URLEncoder.encode("occupation","UTF-8") + "=" + URLEncoder.encode("024", "UTF-8")); /*직종-소프트웨어*/
	        urlBuilder.append("&" + URLEncoder.encode("occupation","UTF-8") + "=" + URLEncoder.encode("025", "UTF-8")); /*직종-데이터&네트워크*/
//	        urlBuilder.append("&" + URLEncoder.encode("occupation","UTF-8") + "=" + URLEncoder.encode("017", "UTF-8")); /*직종-경영지원*/
//	        urlBuilder.append("&" + URLEncoder.encode("occupation","UTF-8") + "=" + URLEncoder.encode("018", "UTF-8")); /*직종-회계,경리*/
//	        urlBuilder.append("&" + URLEncoder.encode("occupation","UTF-8") + "=" + URLEncoder.encode("026201", "UTF-8")); /*직종-인사*/
//	        urlBuilder.append("&" + URLEncoder.encode("occupation","UTF-8") + "=" + URLEncoder.encode("026301", "UTF-8")); /*직종-총무*/
	 
	        URL url = new URL(urlBuilder.toString());
	        HttpURLConnection conn = (HttpURLConnection) url.openConnection();
	        conn.setRequestMethod("GET");
	        conn.setRequestProperty("Content-type", "application/json");
	        System.out.println("Response code: " + conn.getResponseCode());
	        // XML parse 통해서 VO 형태에 담기
	        
	        
	        BufferedReader rd;
	        if(conn.getResponseCode() >= 200 && conn.getResponseCode() <= 300) {
	            rd = new BufferedReader(new InputStreamReader(conn.getInputStream()));
	        } else {
	            rd = new BufferedReader(new InputStreamReader(conn.getErrorStream()));
	        }
	        StringBuilder sb = new StringBuilder();
	        String line;
	        while ((line = rd.readLine()) != null) {
	            sb.append(line);
	        }
	        rd.close();
	        conn.disconnect();
	        System.out.println(sb.toString());
	    }
}

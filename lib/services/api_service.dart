
import 'dart:convert';

import 'package:flutter_codigo5_youapp/models/channel_model.dart';
import 'package:flutter_codigo5_youapp/models/video_model.dart';
import 'package:http/http.dart' as http;

class APIService{



  Future<List<VideoModel>> getVideos() async{
    String _path = "https://youtube.googleapis.com/youtube/v3/search?part=snippet&key=AIzaSyDcwD_ZOkxDiAgxn8QhG7lUao7afdJPBrE&maxResults=20&regionCode=US";
    Uri _uri = Uri.parse(_path);
    http.Response response = await http.get(_uri);
    if(response.statusCode == 200){
      Map<String, dynamic> mapVideo = json.decode(response.body);
      List videos = mapVideo["items"];
      List<VideoModel> videoModelList = videos.map((e) => VideoModel.fromJson(e)).toList();
      return videoModelList;
    }
    return [];
  }


  Future<ChannelModel?> getChannel(String channelId) async{
    String _path = "https://youtube.googleapis.com/youtube/v3/channels?part=snippet,brandingSettings,contentDetails,topicDetails&id=$channelId&key=AIzaSyDcwD_ZOkxDiAgxn8QhG7lUao7afdJPBrE";
    Uri _uri = Uri.parse(_path);
    http.Response response = await http.get(_uri);
    if(response.statusCode == 200){
      Map<String, dynamic> myMap = json.decode(response.body);
      Map<String, dynamic> channelMap = myMap["items"][0];
      ChannelModel channelModel = ChannelModel.fromJson(channelMap);
      return channelModel;
    }
    return null;
  }




}
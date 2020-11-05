$(function() {
  var API_KEY = "73d43f1ff709c9a98e5070ac050bb160";
  var city = 'fuchu';
  var url = 'http://api.openweathermap.org/data/2.5/forecast?q=' + city + ',jp&units=metric&APPID=' + API_KEY;
  $.ajax({
    url: url,
    dataType: "json",
    type: 'GET',
  })
  .done(function(data) {
    var insertHTML = "";
    var cityName =  data.city.name;
    $('#city-name').html(cityName);
    //無料枠で5日分の天気表示。デフォルトでは3時間ごとの天気を取得するため、
    //8の倍数の時のみデータを取得することにより、24時間ごとの天気が取得される
    for (var i = 0; i <= 32; i = i + 8) {
      insertHTML += buildHTML(data, i);
    }
    $('#weather1').html(insertHTML);
  })
  .fail(function(data) {
    alert("失敗しました");
  });
});
 
function buildHTML(data, i) {
  //曜日の日本語化のため、配列を用意する
  var Week = new Array("(日)","(月)","(火)","(水)","(木)","(金)","(土)");
 
  //日付、時間を取得
  var date = new Date(data.list[i].dt_txt);
 
  //UTCとの時差を無くす(日本は-9時間のため9を足す)
  date.setHours(date.getHours() + 9);
 
  //月を取得。getMonth()は0~11を返すため1を足すことによって1月~12月を返すように設定
  var month = date.getMonth() + 1;
 
  //月＋日＋曜日をdayに代入。getDay()は0~6を返すためWeek配列内のインデックスに対応した文字列を取得
  var day = month + "/" + date.getDate() + Week[date.getDay()];
 
  //天気のアイコンを取得
  var icon = data.list[i].weather[0].icon;
 
  var html =
  '<div class="weather-report">' +
    '<img src="http://openweathermap.org/img/w/' + icon + '.png">' +
    '<span class="weather-date">' + day + '</span>' +
    '<div class="weather-temp-max">' + "最高：" + Math.round(data.list[i].main.temp_max) + '℃</div>' +
    '<span class="weather-temp-min">' + "風速：" + (data.list[i].wind.speed) + 'm</span>' +
    '<br><br>' +
  '</div>';
  return html

}
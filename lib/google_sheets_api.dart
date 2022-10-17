import 'package:gsheets/gsheets.dart';

class GoogleSheetsApi{
  static const _credentials = r'''
{
  "type": "service_account",
  "project_id": "todo-gsheets",
  "private_key_id": "289e52e2a53acb3903c1cfb36fefc6ea96325ef9",
  "private_key": "-----BEGIN PRIVATE KEY-----\nMIIEvAIBADANBgkqhkiG9w0BAQEFAASCBKYwggSiAgEAAoIBAQC8/NetgQUeyTd3\nR3d9Oqa1QfCNS9JRuQkyYeZ8s86D6zBtX1fJIwiTMCwow5/MNVukDXWfTz4gNgDj\nW2A5RVsVpDnVtDp1JWyKH4moRoRmUttHFD5MX92UOYJkMPO9nVKaSx+M2yf48Hnn\nNwbkg39mDRSETX9OeJZqQg9G2gFTUzwyHuKqcI8n1PaB0zqjpMPK87Qy/Bl9xvy9\nJJuOTU02XzT3P4sdIGzNOcwCt3ydTs0pXcJ0k6w8swCS7FK4ey/DEhtBSKnEoGlH\ngVWanOuVxlKGPk6FrNdxV925j2+h+RLD9/VqITk6LYc0hkjhkuwfRecvsWS+VjcY\ni6bgBPIFAgMBAAECggEAB8s6ntBrFGOyeqQTILI+RUvgnocht5aUs0P31C07J1QX\n9W7A6U3dUOqj65Nzv+F0c83NS8JiGsR3YWj3jS0XzkrtSqup3IJsWT7nN64e0DR7\nEBGc5xvuAKqlfrnJF4kJKs1N0gqIubq7IEaz7VEh/CSuc61ZgnQ1KdErHZ4of1Xl\nhL+nen51omYoYqkJod6oy5RH34IMeW0VBmJMlWly9kPMADFabrrlzFv4l5fGZ7/9\nkIdaq+btjS+65QM9uOzhssrtgFoE85eNha52MBbNNwQabonC4MA9z+7Wvk4ANQZq\n6i92VHppLhZTp5TtgS8XFoiP/slk6Nf22fjzVSyS2QKBgQDmEsdZOv5YFYYJhh0V\nJIxcd0q1uI9CR5IIVkrGunbcly62XGU57U/EnrOGPmDKDfwF4eDT9nnUh8Z45ZlM\nG7sRp17XHm5KRc86qsXg/iDPziLIdUt1Y94TWSXHZAmpQVSofMuwXYAFSeQfOD0F\nXv72Sdu4bZLpjn4Aop4aqrkdWQKBgQDSSM/tEKOTLMEhDFeE0Mk0FdNWcbfuKN6x\n0Wbq2mrgIeZgP6ciOOaCskCQfmDJAXgFMxV674RJZ7/KpMNc+svBmWc6Ec0/32HO\nYUArFNNQuJJ4pfg7PEUobpyg8NZnHLGWMaLbCp4oK4hMyUvWK7xnJwYoSMublOvG\n+7Bgyq0IjQKBgEQR/kUaPTJWe+fJdEVTIOwip0oIpuoXPs+UqF8PwCcX28w8nf57\nhgRIaBkpz304kf4zjE9qNzV4TnJqi+aGtdxNRrQi3sK+0Mcsy4r75T1WYdgpTAAZ\nYhUbZSAPKwSWvbNz6Nfvcfcem43ZF8TFDG5V/9obIUJU1FbfxiNhq49RAoGAIkci\nNbefom8KMFPttEXAdpAUOiQhYl4hJwVGbIQcJdsAzbGykd6KnMVnxuYC6uElaluQ\nZdDDVJ/n4KWI/xAWxME31XxvY7kLHXQ23I7xf1gG8EnFtAo4D8YwHAAGQxqnTB9d\nN618aHnoJvQtO4U3mez/kPOE1SCqam4+qxh+qkUCgYAeYcYWVwAeaoRPUSeYUCEj\nl1ebx1JkHcZFGoQIwhIxObyL5rIq3+ztVN+xB9PyvtWuYCXvEeQR5jESPOhuBaRH\n7Z/DqGPvb41ESV4hN4tGP0/CEYzoAYFg+a+FRsZlos4xtle/cPhJaq4MlvVg8QZJ\n+4idwuD2flHrBxbfidickw==\n-----END PRIVATE KEY-----\n",
  "client_email": "fluttergsheetst@todo-gsheets.iam.gserviceaccount.com",
  "client_id": "113393906622205179304",
  "auth_uri": "https://accounts.google.com/o/oauth2/auth",
  "token_uri": "https://oauth2.googleapis.com/token",
  "auth_provider_x509_cert_url": "https://www.googleapis.com/oauth2/v1/certs",
  "client_x509_cert_url": "https://www.googleapis.com/robot/v1/metadata/x509/fluttergsheetst%40todo-gsheets.iam.gserviceaccount.com"
}
''';
static const _spreadsheetid = '1Qd0JpU4H6LUJ7RLZ-bToYvEAqld8eRYNMkjKsaWYy7o';
static final _gsheets = GSheets(_credentials);
static Worksheet? _worksheet;



static int numberofnotes = 0;
static List<String> currentnotes = [];
static bool loading = true;


Future init() async{
  final ss = await _gsheets.spreadsheet(_spreadsheetid);
  _worksheet = ss.worksheetByTitle('worksheet1');
  countrows();
}

static Future countrows() async{
  while(await _worksheet!.values.value(column: 1, row: numberofnotes + 1)!= ''){
    numberofnotes++;
  }
  loadnotes();
}
static Future loadnotes() async{
  if(_worksheet == null) return;
  for(int i = 0;i<numberofnotes;i++){
    final String newNote =
    await _worksheet!.values.value(column: 1, row: i+1);

    if(currentnotes.length < numberofnotes){
      currentnotes.add(newNote);
    }
  }
  loading = false;
}

static Future insert(String note) async{
   if(_worksheet == null)return;
   numberofnotes++;
   currentnotes.add(note);
   await  _worksheet!.values.appendRow([note]);
}

}
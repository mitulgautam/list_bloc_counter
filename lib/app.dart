import 'package:flutter/material.dart';
import 'package:list_bloc_counter/bloc.dart';

class App extends StatefulWidget {
  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  List<String> list = ['M', 'I', 'T', 'U', 'L'];

  @override
  Widget build(BuildContext context) {
    return Container(
        width: MediaQuery.of(context).size.width,
        child: ListView.builder(
            itemCount: list.length,
            itemBuilder: (BuildContext context, int index) {
              return _card(list[index]);
            }));
  }

  Widget _card(String string) {
    int count = 0;
    CounterBloc bloc = CounterBloc();
    return Container(height: 256.0,
      child: Card(
        margin: EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
              height: 100.0,
              width: 100.0,
              child: CircleAvatar(
                child: Text(
                  string,
                  style: TextStyle(fontSize: 64.0),
                ),
              ),
            ),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  StreamBuilder<int>(
                      initialData: 0,
                      stream: bloc.outputStream,
                      builder: (context, snapshot) {
                        return Text(
                          snapshot.data.toString(),
                          style: TextStyle(
                              color: Colors.deepOrange, fontSize: 64.0),
                        );
                      }),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      RaisedButton(
                        padding: EdgeInsets.all(16.0),
                        child: Icon(
                          Icons.exposure_plus_1,
                          color: Colors.white,
                          size: 32.0,
                        ),
                        color: Colors.deepOrange,
                        onPressed: () {
                          bloc.inputSink.add(++count);
                        },
                      ),
                      OutlineButton(
                        padding: EdgeInsets.all(16.0),
                        child: Icon(
                          Icons.exposure_neg_1,
                          color: Colors.deepOrange,
                          size: 32.0,
                        ),
                        borderSide: BorderSide(color: Colors.deepOrange),
                        onPressed: () {
                          bloc.inputSink.add(--count);
                        },
                      ),
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

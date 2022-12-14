import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';

import '../store/counter_actions.dart';

class CounterPage extends StatelessWidget {
  final String title;

  CounterPage({
    Key? key,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      title: title,
      home: Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Connect the Store to a Text Widget that renders the current
              // count.
              //
              // We'll wrap the Text Widget in a `StoreConnector` Widget. The
              // `StoreConnector` will find the `Store` from the nearest
              // `StoreProvider` ancestor, convert it into a String of the
              // latest count, and pass that String  to the `builder` function
              // as the `count`.
              //
              // Every time the button is tapped, an action is dispatched and
              // run through the reducer. After the reducer updates the state,
              // the Widget will be automatically rebuilt with the latest
              // count. No need to manually manage subscriptions or Streams!
              StoreConnector<int, String>(
                converter: (store) => store.state.toString(),
                builder: (context, count) {
                  return Text(
                    'Count: $count',
                    style: Theme.of(context).textTheme.headline4,
                  );
                },
              )
            ],
          ),
        ),
        // Connect the Store to a FloatingActionButton. In this case, we'll
        // use the Store to build a callback that will dispatch an Increment
        // Action.
        //
        // Then, we'll pass this callback to the button's `onPressed` handler.
        floatingActionButton: StoreConnector<int, VoidCallback>(
          converter: (store) {
            // Return a `VoidCallback`, which is a fancy name for a function
            // with no parameters and no return value.
            // It only dispatches an Increment action.
            return () => store.dispatch(CounterActions.Increment);
          },
          builder: (context, callback) {
            return FloatingActionButton(
              // Attach the `callback` to the `onPressed` attribute
              onPressed: callback,
              tooltip: 'Increment',
              child: Icon(Icons.add),
            );
          },
        ),
      ),
    );
  }
}
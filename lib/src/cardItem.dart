import 'package:flutter/material.dart';
import 'package:flip_card/flip_card.dart';

class CardItem extends StatelessWidget {
  CardItem({@required this.handleFlip, @required this.index});

  final Function handleFlip;
  final int index;
  final GlobalKey<FlipCardState> cardKey = GlobalKey<FlipCardState>();

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0.0,
      child: FlipCard(
          key: cardKey,
          flipOnTouch: false,
          direction: FlipDirection.HORIZONTAL,
          front: __buildSide('front'),
          back: __buildSide('back')),
    );
  }

  Widget __buildSide(String side) {
    var childRenderer =
        (side == 'front') ? this.__buildFrontSide : this.__buildBackSide;

    return TextButton(
      onPressed: () => cardKey.currentState.toggleCard(),
      child: childRenderer(),
      style: ButtonStyle(
          padding:
              MaterialStateProperty.all<EdgeInsetsGeometry>(EdgeInsets.zero)),
    );
  }

  Widget __buildFrontSide() {
    return Container(
      decoration: BoxDecoration(
          border: Border.all(color: Color(0xffb6895a), width: 5),
          borderRadius: BorderRadius.all(Radius.circular(4))),
      child: Center(
          child: Container(
        margin: EdgeInsets.all(2),
        decoration: BoxDecoration(
          color: Color(0xff573122),
        ),
      )),
    );
  }

  Widget __buildBackSide() {
    return Container(
      decoration: BoxDecoration(
          border: Border.all(color: Color(0xffb6895a), width: 5),
          borderRadius: BorderRadius.all(Radius.circular(4))),
      child: Center(
        child: Container(
          margin: EdgeInsets.all(2),
          decoration: BoxDecoration(color: Color(0xfff5ddc4)),
          child: Image(
            image: AssetImage('lib/assets/base_emoji.png'),
          ),
        ),
      ),
    );
  }
}

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:ok/app/data_visual/widget/shape.dart';

import '../model/data_model.dart';

class CardItem0 extends StatelessWidget {
  final DataModel dataModel;

  const CardItem0({
    super.key,
    required this.dataModel,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
      elevation: 0.0,
      child: Column(
        children: [
          HexagonShape(
            subtitle: dataModel.subtitle,
            value: dataModel.value,
          ),
          Container(
            width: double.infinity,
            height: 48.0,
            color: Colors.red,
            child: Center(
              child: Text(
                dataModel.title,
                style: const TextStyle(
                  fontSize: 38.0,
                  color: Colors.white,
                  height: 1.0,
                ),
              ),
            ),
          ),
          Container(
            width: double.infinity,
            height: 201,
            color: Colors.green,
            padding: const EdgeInsets.only(left: 4.0),
            child: Center(
              child: Text(
                dataModel.desc,
                style: const TextStyle(
                  fontSize: 40.0,
                  color: Colors.white,
                  height: 1.0,
                ),
              ),
            ),
          ),
          ClipRRect(
            borderRadius: const BorderRadius.only(
              bottomLeft: Radius.circular(8.0),
              bottomRight: Radius.circular(8.0),
            ),
            child: SizedBox(
              width: double.infinity,
              height: 413.0,
              child: CachedNetworkImage(
                imageUrl: dataModel.pic,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class DelayedCardItem extends StatefulWidget {
  final DataModel dataModel;
  final Duration delayDuration;

  const DelayedCardItem({
    super.key,
    required this.dataModel,
    required this.delayDuration,
  });

  @override
  DelayedCardItemState createState() => DelayedCardItemState();
}

class DelayedCardItemState extends State<DelayedCardItem> {
  bool _showCard = false;

  @override
  void initState() {
    super.initState();
    Future.delayed(widget.delayDuration, () {
      setState(() {
        _showCard = true;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return _showCard ? CardItem0(dataModel: widget.dataModel) : Container();
  }
}

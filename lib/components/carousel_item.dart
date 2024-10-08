import 'package:TableReserver/api/carousel_api.dart';
import 'package:flutter/material.dart';

import '../themes/theme.dart';

class CarouselItem extends StatefulWidget {
  final String currentCity;

  const CarouselItem(this.currentCity, {super.key});

  @override
  State<CarouselItem> createState() => _CarouselItemState();
}

class _CarouselItemState extends State<CarouselItem> {
  String? _imageLink;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
  }

  @override
  void initState() {
    super.initState();
    _getCityImage();
  }

  void _getCityImage() {
    String imageLink = getImage(widget.currentCity);
    setState(() {
      _imageLink = imageLink;
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 256,
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.surface,
          borderRadius: BorderRadius.circular(8),
        ),
        child: InkWell(
          onTap: () {
            ScaffoldMessenger.of(context).hideCurrentSnackBar();
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                backgroundColor: AppThemes.infoColor,
                content: Text('Searching by location currently unavailable'),
                duration: Duration(seconds: 2),
              ),
            );
          },
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              _buildImage(),
              _buildText(),
            ],
          ),
        ));
  }

  Padding _buildText() => Padding(
      padding: const EdgeInsetsDirectional.fromSTEB(0, 12, 0, 0),
      child: Column(mainAxisSize: MainAxisSize.max, children: [
        Align(
            alignment: const AlignmentDirectional(-1, 0),
            child: Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(12, 0, 0, 0),
                child: Text(widget.currentCity,
                    style: const TextStyle(
                      color: AppThemes.accent1,
                      fontSize: 18,
                      fontFamily: 'Oswald',
                    )))),
        Align(
            alignment: const AlignmentDirectional(-1, 0),
            child: Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(12, 0, 0, 0),
              child: Text('Discover new restaurants in ${widget.currentCity}!',
                  style: Theme.of(context).textTheme.bodyMedium),
            ))
      ]));

  ClipRRect _buildImage() => ClipRRect(
      borderRadius: const BorderRadius.only(
        topLeft: Radius.circular(8),
        topRight: Radius.circular(8),
      ),
      child: Image.asset(
        _imageLink!,
        width: double.infinity,
        height: 128,
        fit: BoxFit.cover,
      ));
}

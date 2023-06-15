import 'package:flutter/material.dart';

class DetailPage extends StatefulWidget {
  final endTime;
  final location;
  final startTime;
  final desc;
  final uuid;
  final date;
  final title;
  final image;
  const DetailPage({
    super.key,
    required this.date,
    required this.image,
    required this.title,
    required this.desc,
    required this.endTime,
    required this.uuid,
    required this.location,
    required this.startTime,
  });

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}

import 'package:flutter/material.dart';

import 'course_card.dart';

// dummy datas
final List<Map<String, dynamic>> dummyDatas = [
  {
    'imageUrl':
        'https://images.pexels.com/photos/4708902/pexels-photo-4708902.jpeg?auto=compress&cs=tinysrgb&w=400',
    'title': 'Guitar 101',
    'progress': 0.2,
  },
  {
    'imageUrl':
        'https://images.pexels.com/photos/6671979/pexels-photo-6671979.jpeg?auto=compress&cs=tinysrgb&w=400',
    'title': 'Guitar 102',
    'progress': 0.4,
  },
  {
    'imageUrl':
        'https://images.pexels.com/photos/7079137/pexels-photo-7079137.jpeg?auto=compress&cs=tinysrgb&w=400',
    'title': 'Guitar 103',
    'progress': 0.6,
  },
  {
    'imageUrl':
        'https://images.pexels.com/photos/7521049/pexels-photo-7521049.jpeg?auto=compress&cs=tinysrgb&w=400',
    'title': 'Guitar 104',
    'progress': 0.8,
  },
  {
    'imageUrl':
        'https://images.pexels.com/photos/7886316/pexels-photo-7886316.jpeg?auto=compress&cs=tinysrgb&w=400',
    'title': 'Guitar 105',
    'progress': 1.0,
  },
  {
    'imageUrl':
        'https://images.pexels.com/photos/4472069/pexels-photo-4472069.jpeg?auto=compress&cs=tinysrgb&w=400',
    'title': 'Guitar 106',
    'progress': 0.2,
  },
  {
    'imageUrl':
        'https://images.pexels.com/photos/8190043/pexels-photo-8190043.jpeg?auto=compress&cs=tinysrgb&w=400',
    'title': 'Guitar 107',
    'progress': 0.4,
  },
  {
    'imageUrl':
        'https://images.pexels.com/photos/8189623/pexels-photo-8189623.jpeg?auto=compress&cs=tinysrgb&w=400',
    'title': 'Guitar 108',
    'progress': 0.6,
  },
  {
    'imageUrl':
        'https://images.pexels.com/photos/8929545/pexels-photo-8929545.jpeg?auto=compress&cs=tinysrgb&w=400',
    'title': 'Guitar 109',
    'progress': 0.8,
  },
];

class CourseList extends StatelessWidget {
  const CourseList({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: EdgeInsets.only(top: 14.0),
      itemCount: dummyDatas.length,
      physics: BouncingScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 8,
        mainAxisSpacing: 8,
        childAspectRatio: .95,
      ),
      itemBuilder: (context, index) => CourseCard(
        imageUrl: dummyDatas[index]['imageUrl'],
        title: dummyDatas[index]['title'],
        progress: dummyDatas[index]['progress'],
      ),
    );
  }
}

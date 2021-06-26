import 'package:flutter/material.dart';

import 'package:simple_movie_app/models/movie.dart';
import 'package:simple_movie_app/widgets/chip_tag.dart';

class ListMovieCard extends StatelessWidget {
  const ListMovieCard({
    Key? key,
    required this.movie,
    required this.onTap,
  }) : super(key: key);
  final Movie movie;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.fromLTRB(16, 16, 16, 0),
      child: InkWell(
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                movie.title,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(height: 8),
              Row(
                children: [
                  Icon(Icons.assignment_ind_outlined),
                  SizedBox(width: 8),
                  Expanded(child: Text(movie.director)),
                ],
              ),
              Visibility(
                visible: movie.summary != '',
                child: Column(
                  children: [
                    SizedBox(height: 8),
                    Text(
                      movie.summary,
                      style: TextStyle(color: Colors.grey),
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
              Wrap(
                spacing: 4,
                children: movie.tags
                    .map(
                      (e) => ChipTag(
                        title: e,
                        textSize: 10,
                      ),
                    )
                    .toList(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

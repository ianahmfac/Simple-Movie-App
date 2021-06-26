import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:simple_movie_app/helpers/dummy_data.dart';

import 'package:simple_movie_app/mobx/movie_state.dart';
import 'package:simple_movie_app/models/movie.dart';
import 'package:simple_movie_app/widgets/chip_tag.dart';
import 'package:simple_movie_app/widgets/custom_text_button.dart';
import 'package:simple_movie_app/widgets/platform_alert_dialog.dart';

class EditMovie extends StatefulWidget {
  const EditMovie({
    Key? key,
    this.movie,
  }) : super(key: key);
  final Movie? movie;

  @override
  _EditMovieState createState() => _EditMovieState();
}

class _EditMovieState extends State<EditMovie> {
  late final MovieState _movieState;
  final _formKey = GlobalKey<FormState>();

  String _title = '';
  String _director = '';
  String _summary = '';
  final List<String> _tags = [];

  final List<String> _tagItems = [];

  bool get _isFormValid => _formKey.currentState!.validate();
  bool get _hasMovie => widget.movie != null;

  @override
  void initState() {
    super.initState();
    _movieState = Provider.of<MovieState>(context, listen: false);
    _tagItems.addAll(DummyData.getTagItems);
    if (_hasMovie) {
      _title = widget.movie!.title;
      _director = widget.movie!.director;
      _tags.addAll(widget.movie!.tags);
      _summary = widget.movie!.summary;

      _tags.forEach((e) => _tagItems.remove(e));
    }
  }

  Movie _currentMovie(String id) => Movie(
        id: id,
        title: _title,
        director: _director,
        tags: _tags,
        summary: _summary,
      );

  void _addMovie() {
    if (!_isFormValid) return;
    _formKey.currentState!.save();

    final movie = _currentMovie(DateTime.now().toIso8601String());
    _movieState.addMovie(movie);
    context.router.pop();
  }

  Future<void> _deleteMovie() async {
    final isDeleted = await PlatformAlertDialog(
      titleText: 'Delete Movie',
      contentText: 'Do you want to delete this movie from your list?',
      buttonDialogText: 'Delete',
      cancelButtonDialogText: 'Cancel',
    ).show(context);
    if (isDeleted!) {
      _movieState.deleteMovie(widget.movie!.id);
      context.router.pop();
    }
  }

  Future<void> _updateMovie() async {
    if (!_isFormValid) return;
    _formKey.currentState!.save();
    final isUpdated = await PlatformAlertDialog(
      titleText: 'Update Movie',
      contentText: 'Do you want to update this movie?',
      buttonDialogText: 'Update',
      cancelButtonDialogText: 'Cancel',
    ).show(context);
    if (isUpdated!) {
      final movie = _currentMovie(widget.movie!.id);
      _movieState.updateMovie(movie);
      context.router.pop();
    }
  }

  void _addTag(String? tag) {
    if (tag == null) return;
    setState(() {
      _tagItems.remove(tag);
      _tags.add(tag);
    });
  }

  void _deleteTag(String tag) {
    setState(() {
      _tags.remove(tag);
      _tagItems.add(tag);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_hasMovie ? 'Edit Movie' : 'Add New Movie'),
        actions: _hasMovie
            ? [
                CustomTextButton(
                  title: 'DELETE',
                  onPressed: _deleteMovie,
                ),
                CustomTextButton(
                  title: 'UPDATE',
                  onPressed: _updateMovie,
                ),
              ]
            : [
                CustomTextButton(
                  title: 'SAVE',
                  onPressed: () => _addMovie(),
                ),
              ],
      ),
      body: SingleChildScrollView(
        child: _buildContent(),
      ),
    );
  }

  Widget _buildContent() {
    return Form(
      key: _formKey,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildTitleForm(),
            SizedBox(height: 16.0),
            _buildDirectorForm(),
            SizedBox(height: 16.0),
            ..._buildTagsForm(), // Using spread operator
            SizedBox(height: 16.0),
            _buildSummaryForm(),
            SizedBox(height: 16.0),
            Text(
              '*) Cannot be empty',
              style: TextStyle(
                fontSize: 12,
                color: Colors.grey,
                fontStyle: FontStyle.italic,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDirectorForm() {
    return TextFormField(
      initialValue: _director,
      textInputAction: TextInputAction.next,
      textCapitalization: TextCapitalization.words,
      decoration: InputDecoration(
        border: OutlineInputBorder(),
        labelText: 'Director*',
      ),
      onSaved: (newValue) => _director = newValue!,
      validator: (value) {
        if (value!.trim().isEmpty) return 'Director cannot be empty';
        return null;
      },
    );
  }

  Widget _buildTitleForm() {
    return TextFormField(
      initialValue: _title,
      textInputAction: TextInputAction.next,
      textCapitalization: TextCapitalization.words,
      decoration: InputDecoration(
        border: OutlineInputBorder(),
        labelText: 'Title*',
      ),
      onSaved: (newValue) => _title = newValue!,
      validator: (value) {
        if (value!.trim().isEmpty) return 'Title cannot be empty';
        return null;
      },
    );
  }

  Widget _buildSummaryForm() {
    return TextFormField(
      initialValue: _summary,
      textInputAction: TextInputAction.newline,
      textCapitalization: TextCapitalization.sentences,
      minLines: 1,
      maxLines: 5,
      decoration: InputDecoration(
        border: OutlineInputBorder(),
        labelText: 'Summary',
      ),
      onSaved: (newValue) => _summary = newValue!,
    );
  }

  List<Widget> _buildTagsForm() {
    return [
      Text(
        'Tags',
        style: TextStyle(fontSize: 16),
      ),
      SizedBox(height: 4),
      Container(
        width: double.infinity,
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(4),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: DropdownButtonHideUnderline(
          child: Row(
            children: [
              _buildSelectedTag(),
              _buildDropdownButton(),
            ],
          ),
        ),
      ),
    ];
  }

  Widget _buildSelectedTag() {
    return Expanded(
      child: Wrap(
        children: _tags.map((tag) {
          return ChipTag(
            title: tag,
            onDeleted: () => _deleteTag(tag),
          );
        }).toList(),
        spacing: 4,
      ),
    );
  }

  Widget _buildDropdownButton() {
    return DropdownButton<String>(
      items: _tagItems
          .map(
            (e) => DropdownMenuItem<String>(child: Text(e), value: e),
          )
          .toList(),
      onChanged: _addTag,
    );
  }
}

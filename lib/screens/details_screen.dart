import 'package:day6_json_inclass/models/course_models.dart';
import 'package:flutter/material.dart';

class DetailsScreen extends StatelessWidget {
  final CourseModels course;

  const DetailsScreen({super.key, required this.course});

  @override
  Widget build(BuildContext context) {
    final title = (course.title ?? '').trim();
    final courseTitle = title.isEmpty ? 'No title' : title;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Back button
              Padding(
                padding: const EdgeInsets.all(16),
                child: GestureDetector(
                  onTap: () => Navigator.pop(context),
                  child: const Icon(
                    Icons.arrow_back,
                    size: 28,
                    color: Colors.black87,
                  ),
                ),
              ),
              // Hero image
              if (course.image != null && course.image!.isNotEmpty)
                Image.network(
                  course.image!,
                  height: 400,
                  width: double.infinity,
                  fit: BoxFit.cover,
                )
              else
                Container(
                  height: 400,
                  width: double.infinity,
                  color: const Color(0xFF2B2B2B),
                  child: const Center(
                    child: Icon(
                      Icons.image_not_supported_outlined,
                      color: Colors.white54,
                      size: 64,
                    ),
                  ),
                ),
              // Title and level section
              Padding(
                padding: const EdgeInsets.all(24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                          child: Text(
                            courseTitle,
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              fontSize: 28,
                              fontWeight: FontWeight.w700,
                              color: Colors.black87,
                            ),
                          ),
                        ),
                        if (title.isEmpty)
                          const Padding(
                            padding: EdgeInsets.only(left: 8),
                            child: Icon(
                              Icons.close,
                              color: Colors.red,
                              size: 32,
                            ),
                          ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    Text(
                      course.level ?? 'Beginner',
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                        color: Colors.black54,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
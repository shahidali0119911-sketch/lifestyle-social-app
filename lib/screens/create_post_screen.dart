import 'package:flutter/material.dart';

class CreatePostScreen extends StatefulWidget {
  const CreatePostScreen({super.key});

  @override
  State<CreatePostScreen> createState() => _CreatePostScreenState();
}

class _CreatePostScreenState extends State<CreatePostScreen> {
  final TextEditingController _controller = TextEditingController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Create Post'),
        actions: [
          TextButton(
            onPressed: () {},
            child: const Text('Post', style: TextStyle(fontWeight: FontWeight.w700)),
          ),
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              Row(
                children: const [
                  CircleAvatar(radius: 22, child: Icon(Icons.person)),
                  SizedBox(width: 12),
                  Text('Sofia James', style: TextStyle(fontWeight: FontWeight.w700)),
                ],
              ),
              const SizedBox(height: 16),
              TextField(
                controller: _controller,
                maxLines: 5,
                decoration: const InputDecoration(
                  hintText: 'What’s on your mind?',
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(18)),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
              const SizedBox(height: 18),
              Row(
                children: [
                  _MediaChip(icon: Icons.image, label: 'Photo'),
                  const SizedBox(width: 10),
                  _MediaChip(icon: Icons.videocam, label: 'Video'),
                  const SizedBox(width: 10),
                  _MediaChip(icon: Icons.location_on, label: 'Location'),
                ],
              ),
              const Spacer(),
              Container(
                height: 160,
                width: double.infinity,
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [Color(0xFFE0E7FF), Color(0xFFE9D5FF)],
                  ),
                  borderRadius: BorderRadius.circular(24),
                ),
                child: const Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.add_photo_alternate_outlined, size: 42, color: Color(0xFF4F46E5)),
                      SizedBox(height: 8),
                      Text('Add photo or video', style: TextStyle(fontWeight: FontWeight.w700)),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _MediaChip extends StatelessWidget {
  const _MediaChip({required this.icon, required this.label});

  final IconData icon;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
      ),
      child: Row(
        children: [
          Icon(icon, size: 18, color: const Color(0xFF4F46E5)),
          const SizedBox(width: 8),
          Text(label, style: const TextStyle(fontWeight: FontWeight.w600)),
        ],
      ),
    );
  }
}

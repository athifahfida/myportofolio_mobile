import 'package:material_ui/material_ui.dart';
import 'package:myportofolio_mobile/widgets/left_drawer.dart';

class SkillFormPage extends StatefulWidget {
  const SkillFormPage({super.key});

  @override
  State<SkillFormPage> createState() => _SkillFormPageState();
}

class _SkillFormPageState extends State<SkillFormPage> {
  final _formKey = GlobalKey<FormState>();

  static const Map<String, String> _categories = {
    'frontend': 'Frontend',
    'backend': 'Backend',
    'tools': 'Tools',
    'soft': 'Soft Skill',
  };
  static const Map<String, String> _proficiencies = {
    'beginner': 'Beginner',
    'intermediate': 'Intermediate',
    'advanced': 'Advanced',
    'expert': 'Expert',
  };

  String _name = '';
  String? _category;
  String? _proficiency;
  String _iconUrl = '';

  bool _isValidUrl(String value) {
    final uri = Uri.tryParse(value);
    return uri != null &&
        (uri.scheme == 'http' || uri.scheme == 'https') &&
        uri.host.isNotEmpty;
  }

  void _save() {
    if (!_formKey.currentState!.validate()) return;

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Skill berhasil disimpan'),
          content: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Nama: ${_name.trim()}'),
                Text('Kategori: ${_categories[_category]}'),
                Text('Level: ${_proficiencies[_proficiency]}'),
                Text(
                  'URL Ikon: ${_iconUrl.trim().isEmpty ? '-' : _iconUrl.trim()}',
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Tambah Skill',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: Theme.of(context).colorScheme.primary,
        foregroundColor: Colors.white,
      ),
      drawer: const LeftDrawer(),
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              TextFormField(
                decoration: InputDecoration(
                  hintText: 'Nama skill, contoh: Django',
                  labelText: 'Nama Skill',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
                onChanged: (value) => setState(() => _name = value),
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'Nama skill tidak boleh kosong';
                  }
                  if (value.trim().length > 100) {
                    return 'Nama skill maksimal 100 karakter';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16.0),
              DropdownButtonFormField<String>(
                initialValue: _category,
                decoration: InputDecoration(
                  labelText: 'Kategori',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
                items: _categories.entries
                    .map((e) => DropdownMenuItem(
                          value: e.key,
                          child: Text(e.value),
                        ))
                    .toList(),
                onChanged: (value) => setState(() => _category = value),
                validator: (value) =>
                    value == null ? 'Pilih kategori skill' : null,
              ),
              const SizedBox(height: 16.0),
              DropdownButtonFormField<String>(
                initialValue: _proficiency,
                decoration: InputDecoration(
                  labelText: 'Tingkat Kemahiran',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
                items: _proficiencies.entries
                    .map((e) => DropdownMenuItem(
                          value: e.key,
                          child: Text(e.value),
                        ))
                    .toList(),
                onChanged: (value) => setState(() => _proficiency = value),
                validator: (value) =>
                    value == null ? 'Pilih tingkat kemahiran' : null,
              ),
              const SizedBox(height: 16.0),
              TextFormField(
                keyboardType: TextInputType.url,
                decoration: InputDecoration(
                  hintText: 'https://cdn.example.com/icons/django.svg',
                  labelText: 'URL Ikon (opsional)',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
                onChanged: (value) => setState(() => _iconUrl = value),
                validator: (value) {
                  final text = value?.trim() ?? '';
                  if (text.isEmpty) return null;
                  if (text.length > 500) return 'URL maksimal 500 karakter';
                  if (!_isValidUrl(text)) {
                    return 'Masukkan URL yang valid (http atau https)';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 24.0),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: _save,
                  child: const Text('Simpan'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
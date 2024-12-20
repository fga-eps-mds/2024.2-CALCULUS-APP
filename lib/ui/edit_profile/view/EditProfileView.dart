import 'package:aranduapp/ui/edit_profile/viewModel/EditProfileViewModel.dart';
import 'package:aranduapp/ui/shared/TextEmail.dart';
import 'package:aranduapp/ui/shared/ProfileHeader.dart';
import 'package:aranduapp/ui/shared/TextName.dart';
import 'package:aranduapp/ui/shared/TextPassword.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class EditProfile extends StatelessWidget {
  const EditProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => EditProfileViewModel(context),
      child: const EditProfileScreen(),
    );
  }
}

class EditProfileScreen extends StatelessWidget {
  const EditProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<EditProfileViewModel>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.surface,
        elevation: 0,
        title: Center(
          child: Text(
            'Editar perfil',
            style: TextStyle(
              color: Theme.of(context).colorScheme.onSurface,
              fontSize: 24,
            ),
          ),
        ),
        actions: [
          IconButton(
            color: Theme.of(context).colorScheme.primary,
            icon: const Icon(Icons.notifications),
            onPressed: () {},
          ),
        ],
        leading: IconButton(
          color: Theme.of(context).colorScheme.primary,
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          final isSmallScreen = constraints.maxWidth < 600;
          return SingleChildScrollView(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
            child: Column(
              children: [
                _buildProfileHeader(context),
                SizedBox(height: isSmallScreen ? 30 : 50),
                _buildForm(context, viewModel, isSmallScreen),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _buildForm(BuildContext context, EditProfileViewModel viewModel,
      bool isSmallScreen) {
    return Form(
      key: viewModel.formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          TextName(
            controller: viewModel.firstNameController,
            padding: const EdgeInsets.symmetric(vertical: 0),
          ),
          const SizedBox(height: 20),
          TextEmail(
            padding: const EdgeInsets.symmetric(vertical: 0),
            controller: viewModel.emailController,
          ),
          const SizedBox(height: 20),
          TextPassWord(
            padding: const EdgeInsets.symmetric(vertical: 0),
            controller: viewModel.passwordController,
          ),
          SizedBox(height: isSmallScreen ? 100 : 56),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Expanded(
                child: _saveButton(context, viewModel),
              ),
              SizedBox(width: isSmallScreen ? 10 : 20),
              Expanded(
                child: _deleteButton(context),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildProfileHeader(BuildContext context) {
    return const Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          ProfileHeader(
            name: "Stefani",
            role: "Estudante",
          ),
        ]);
  }

  Widget _saveButton(BuildContext context, EditProfileViewModel viewModel) {
    return ElevatedButton(
      onPressed: () async {
        if (viewModel.isLoading) return;
        try {
          await viewModel.editprofileWithEmailAndPassword();
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Perfil atualizado com sucesso!')),
          );
        } catch (e) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Erro: $e')),
          );
        }
      },
      style: ElevatedButton.styleFrom(
        minimumSize: Size(0, 50),
      ),
      child: Consumer<EditProfileViewModel>(
        builder: (context, value, child) => value.isLoading
            ? const CircularProgressIndicator(value: null)
            : const Text('Salvar'),
      ),
    );
  }

  Widget _deleteButton(BuildContext context) {
    return ElevatedButton(
      onPressed: () => _showDeleteConfirmationDialog(context),
      style: ElevatedButton.styleFrom(
        minimumSize: Size(0, 50),
      ),
      child: const Text('Deletar Conta'),
    );
  }

  void _showDeleteConfirmationDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Confirmar Deleção'),
          content: const Text(
              'Tem certeza de que deseja deletar sua conta? Essa ação não pode ser desfeita.'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Cancelar'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop();
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Conta deletada com sucesso!')),
                );
              },
              child: const Text('Deletar'),
            ),
          ],
        );
      },
    );
  }
}

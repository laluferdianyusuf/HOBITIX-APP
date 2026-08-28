import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hobitix/app/theme/app_colors.dart';
import 'package:hobitix/models/ticket_type_mode.dart';
import 'package:hobitix/shared/widgets/icon_button.dart';
import 'package:hobitix/shared/widgets/identity-information/event_ticket_header.dart';
import 'package:iconsax/iconsax.dart';

class IdentityInformationPage extends StatefulWidget {
  final List<TicketType> tickets;
  final int total;

  const IdentityInformationPage({
    super.key,
    required this.tickets,
    required this.total,
  });

  @override
  State<IdentityInformationPage> createState() =>
      _IdentityInformationPageState();
}

class _IdentityInformationPageState extends State<IdentityInformationPage> {
  bool _useProfileInfo = false;

  final TextEditingController _fullNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _dobController = TextEditingController();
  final TextEditingController _idNumberController = TextEditingController();

  String? _selectedGender;
  String _selectedIdentityType = 'KTP (National ID)';

  @override
  void dispose() {
    _fullNameController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    _dobController.dispose();
    _idNumberController.dispose();
    super.dispose();
  }

  void _onToggleProfileInfo(bool value) {
    setState(() {
      _useProfileInfo = value;
      if (value) {
        // Contoh autofill data profil
        _fullNameController.text = 'John Doe';
        _emailController.text = 'johndoe@example.com';
        _phoneController.text = '81234567890';
      }
    });
  }

  Future<void> _selectDate() async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1940),
      lastDate: DateTime.now(),
    );
    if (picked != null) {
      setState(() {
        _dobController.text =
            "${picked.month.toString().padLeft(2, '0')}/${picked.day.toString().padLeft(2, '0')}/${picked.year}";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    debugPrint('Total Amount: ${widget.total}');
    debugPrint('Jumlah Tiket Ditransfer: ${widget.tickets.length}');

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.background,
        surfaceTintColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        leading: Center(
          child: Padding(
            padding: const EdgeInsets.only(left: 8),
            child: AppIconButton(
              icon: Iconsax.arrow_left,
              onTap: () => context.pop(),
            ),
          ),
        ),
        title: const Text(
          'Identity Information',
          style: TextStyle(
            fontSize: 17,
            fontWeight: FontWeight.w700,
            letterSpacing: -.2,
          ),
        ),
      ),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.fromLTRB(16, 12, 16, 24),
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.05),
              blurRadius: 10,
              offset: const Offset(0, -4),
            ),
          ],
        ),
        child: SizedBox(
          width: double.infinity,
          height: 52,
          child: ElevatedButton(
            onPressed: () {
              // Action saat submit form
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.primary,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              elevation: 0,
            ),
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Continue to Checkout',
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w700,
                    color: Colors.white,
                  ),
                ),
                SizedBox(width: 8),
                Icon(
                  Icons.arrow_forward_rounded,
                  color: Colors.white,
                  size: 20,
                ),
              ],
            ),
          ),
        ),
      ),
      body: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
          const SliverToBoxAdapter(child: EventTicketHeader()),
          SliverPadding(
            padding: const EdgeInsets.fromLTRB(16, 0, 16, 24),
            sliver: SliverList(
              delegate: SliverChildListDelegate([
                _buildUseProfileCard(),
                const SizedBox(height: 16),
                _buildInputField(
                  label: 'FULL NAME',
                  hint: 'Enter your full name',
                  controller: _fullNameController,
                ),
                const SizedBox(height: 12),
                _buildInputField(
                  label: 'EMAIL ADDRESS',
                  hint: 'name@example.com',
                  controller: _emailController,
                  keyboardType: TextInputType.emailAddress,
                ),
                const SizedBox(height: 12),
                _buildInputField(
                  label: 'PHONE NUMBER',
                  hint: '812 3456 7890',
                  controller: _phoneController,
                  keyboardType: TextInputType.phone,
                  prefixText: '+62 ',
                ),
                const SizedBox(height: 12),
                Row(
                  children: [
                    Expanded(child: _buildDateField()),
                    const SizedBox(width: 12),
                    Expanded(child: _buildGenderDropdown()),
                  ],
                ),
                const SizedBox(height: 12),
                _buildIdentityTypeDropdown(),
                const SizedBox(height: 12),
                _buildInputField(
                  label: 'IDENTITY NUMBER',
                  hint: 'Enter ID number',
                  controller: _idNumberController,
                  keyboardType: TextInputType.number,
                ),
              ]),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildUseProfileCard() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: Colors.black.withValues(alpha: 0.04)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Use profile information',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w700,
                    color: Color(0xff17171C),
                  ),
                ),
                SizedBox(height: 2),
                Text(
                  'Quickly fill your details using your account info',
                  style: TextStyle(fontSize: 10, color: Color(0xff8B8B94)),
                ),
              ],
            ),
          ),
          Transform.scale(
            scale: 0.8,
            child: Switch(
              value: _useProfileInfo,
              onChanged: _onToggleProfileInfo,
              activeThumbColor: const Color(0xff5746E7),
              activeTrackColor: const Color(0xff5746E7).withValues(alpha: 0.2),
              inactiveThumbColor: Colors.white,
              inactiveTrackColor: Colors.grey.shade300,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildInputField({
    required String label,
    required String hint,
    required TextEditingController controller,
    TextInputType keyboardType = TextInputType.text,
    String? prefixText,
  }) {
    return Container(
      padding: const EdgeInsets.fromLTRB(16, 12, 16, 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.black.withValues(alpha: 0.08)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: const TextStyle(
              fontSize: 10,
              fontWeight: FontWeight.w700,
              color: Color(0xff777780),
              letterSpacing: 0.5,
            ),
          ),
          const SizedBox(height: 6),
          TextField(
            controller: controller,
            keyboardType: keyboardType,
            style: const TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.w500,
              color: Color(0xff17171C),
            ),
            decoration: InputDecoration(
              isDense: true,
              contentPadding: EdgeInsets.zero,
              border: InputBorder.none,
              hintText: hint,
              hintStyle: const TextStyle(
                fontSize: 13,
                color: Color(0xffB5B5BE),
              ),
              prefixText: prefixText,
              prefixStyle: const TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w500,
                color: Color(0xff17171C),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDateField() {
    return GestureDetector(
      onTap: _selectDate,
      child: Container(
        padding: const EdgeInsets.fromLTRB(16, 10, 16, 10),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: Colors.black.withValues(alpha: 0.08)),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'DATE OF BIRTH',
              style: TextStyle(
                fontSize: 10,
                fontWeight: FontWeight.w700,
                color: Color(0xff777780),
                letterSpacing: 0.5,
              ),
            ),
            const SizedBox(height: 6),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(
                    _dobController.text.isEmpty
                        ? 'mm/dd/yyyy'
                        : _dobController.text,
                    style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w500,
                      color: _dobController.text.isEmpty
                          ? const Color(0xffB5B5BE)
                          : const Color(0xff17171C),
                    ),
                  ),
                ),
                const Icon(
                  Iconsax.calendar,
                  size: 14,
                  color: Color(0xff17171C),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildGenderDropdown() {
    return Container(
      padding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.black.withValues(alpha: 0.08)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'GENDER',
            style: TextStyle(
              fontSize: 10,
              fontWeight: FontWeight.w700,
              color: Color(0xff777780),
              letterSpacing: 0.6,
            ),
          ),
          const SizedBox(height: 6),
          DropdownButtonHideUnderline(
            child: DropdownButton<String>(
              value: _selectedGender,
              isExpanded: true,
              isDense: true,
              hint: const Text(
                'Select',
                style: TextStyle(fontSize: 13, color: Color(0xffB5B5BE)),
              ),
              icon: const Icon(
                Iconsax.arrow_down_1,
                size: 14,
                color: Color(0xff777780),
              ),
              items: ['Male', 'Female'].map((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(
                    value,
                    style: const TextStyle(
                      fontSize: 13,
                      color: Color(0xff17171C),
                    ),
                  ),
                );
              }).toList(),
              onChanged: (newValue) {
                setState(() {
                  _selectedGender = newValue;
                });
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildIdentityTypeDropdown() {
    return Container(
      padding: const EdgeInsets.fromLTRB(16, 10, 16, 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.black.withValues(alpha: 0.08)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'IDENTITY TYPE',
            style: TextStyle(
              fontSize: 10,
              fontWeight: FontWeight.w700,
              color: Color(0xff777780),
              letterSpacing: 0.5,
            ),
          ),
          const SizedBox(height: 6),
          DropdownButtonHideUnderline(
            child: DropdownButton<String>(
              value: _selectedIdentityType,
              isExpanded: true,
              isDense: true,
              icon: const Icon(
                Iconsax.arrow_down_1,
                size: 18,
                color: Color(0xff777780),
              ),
              items: ['KTP (National ID)', 'Passport', 'SIM (Driver License)']
                  .map((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(
                        value,
                        style: const TextStyle(
                          fontSize: 13,
                          color: Color(0xff17171C),
                        ),
                      ),
                    );
                  })
                  .toList(),
              onChanged: (newValue) {
                if (newValue != null) {
                  setState(() {
                    _selectedIdentityType = newValue;
                  });
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hobitix/app/theme/app_colors.dart';
import 'package:hobitix/models/ticket_type_mode.dart';
import 'package:hobitix/shared/widgets/icon_button.dart';
import 'package:iconsax/iconsax.dart';

class CheckoutPage extends StatefulWidget {
  final List<TicketType> tickets;
  final int total;
  final Map<String, dynamic>? identity;

  const CheckoutPage({
    super.key,
    required this.tickets,
    required this.total,
    this.identity,
  });

  @override
  State<CheckoutPage> createState() => _CheckoutPageState();
}

class _CheckoutPageState extends State<CheckoutPage> {
  String _selectedPaymentCategory = 'qris';
  String? _selectedBank;
  bool _isVaExpanded = false;

  final List<Map<String, String>> _bankList = [
    {'code': 'bca', 'name': 'BCA Virtual Account'},
    {'code': 'mandiri', 'name': 'Mandiri Virtual Account'},
    {'code': 'bri', 'name': 'BRI Virtual Account'},
    {'code': 'bni', 'name': 'BNI Virtual Account'},
    {'code': 'cimb', 'name': 'CIMB Niaga Virtual Account'},
  ];

  @override
  Widget build(BuildContext context) {
    int adminFee = 5000;
    int grandTotal = widget.total + adminFee;

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.background,
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
          'Checkout',
          style: TextStyle(fontSize: 17, fontWeight: FontWeight.w700),
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
          height: 52,
          child: ElevatedButton(
            onPressed:
                (_selectedPaymentCategory == 'va' && _selectedBank == null)
                ? null
                : () {
                    context.pushNamed(
                      'payment',
                      extra: <String, dynamic>{
                        'paymentMethod': _selectedPaymentCategory == 'qris'
                            ? 'QRIS'
                            : _selectedBank,
                        'totalAmount': grandTotal,
                        'tickets': widget.tickets,
                        'identity': widget.identity,
                      },
                    );
                  },
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xff5746E7),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              elevation: 0,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Pay Rp ${grandTotal.toString().replaceAllMapped(RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'), (Match m) => '${m[1]}.')}',
                  style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w700,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(width: 8),
                const Icon(
                  Icons.arrow_forward_rounded,
                  color: Colors.white,
                  size: 20,
                ),
              ],
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Widget preview data identitas pemesan
            _buildIdentityCard(),
            const SizedBox(height: 16),
            _buildOrderSummary(),
            const SizedBox(height: 20),
            const Text(
              'Select Payment Method',
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.w700),
            ),
            const SizedBox(height: 12),
            _buildQrisOption(),
            const SizedBox(height: 12),
            _buildVirtualAccountDropdown(),
            const SizedBox(height: 20),
            _buildPriceDetails(adminFee, grandTotal),
          ],
        ),
      ),
    );
  }

  // Widget preview identitas yang dikirim dari halaman sebelumnya
  Widget _buildIdentityCard() {
    final identity = widget.identity ?? {};
    final fullName = identity['fullName'] ?? '-';
    final email = identity['email'] ?? '-';
    final phone = identity['phone'] ?? '-';
    final identityType = identity['identityType'] ?? '-';
    final identityNumber = identity['identityNumber'] ?? '-';

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Identity Details',
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.w700),
              ),
              GestureDetector(
                onTap: () => context.pop(),
                child: const Text(
                  'Edit',
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                    color: Color(0xff5746E7),
                  ),
                ),
              ),
            ],
          ),
          const Divider(height: 20),
          _buildIdentityRow('Full Name', fullName),
          const SizedBox(height: 8),
          _buildIdentityRow('Email', email),
          const SizedBox(height: 8),
          _buildIdentityRow(
            'Phone Number',
            phone.isNotEmpty ? '+62 $phone' : '-',
          ),
          const SizedBox(height: 8),
          _buildIdentityRow(identityType, identityNumber),
        ],
      ),
    );
  }

  Widget _buildIdentityRow(String label, String value) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: const TextStyle(fontSize: 12, color: Color(0xff777780)),
        ),
        Flexible(
          child: Text(
            value,
            textAlign: TextAlign.end,
            style: const TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w600,
              color: Color(0xff17171C),
            ),
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }

  Widget _buildOrderSummary() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Order Summary',
            style: TextStyle(fontSize: 14, fontWeight: FontWeight.w700),
          ),
          const Divider(height: 24),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Indigo Nights Concert',
                style: TextStyle(fontWeight: FontWeight.w600, fontSize: 13),
              ),
              Text(
                '${widget.tickets.length} Ticket(s)',
                style: const TextStyle(color: Colors.grey, fontSize: 12),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildQrisOption() {
    bool isSelected = _selectedPaymentCategory == 'qris';
    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedPaymentCategory = 'qris';
          _selectedBank = null;
        });
      },
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: isSelected ? const Color(0xff5746E7) : Colors.black12,
            width: isSelected ? 2 : 1,
          ),
        ),
        child: Row(
          children: [
            const Icon(Iconsax.scan_barcode, color: Color(0xff5746E7)),
            const SizedBox(width: 12),
            const Expanded(
              child: Text(
                'QRIS (Gopay, OVO, Dana, ShopeePay)',
                style: TextStyle(fontSize: 13, fontWeight: FontWeight.w600),
              ),
            ),
            Radio<String>(
              value: 'qris',
              groupValue: _selectedPaymentCategory,
              onChanged: (val) {
                setState(() {
                  _selectedPaymentCategory = val!;
                  _selectedBank = null;
                });
              },
              activeColor: const Color(0xff5746E7),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildVirtualAccountDropdown() {
    bool isVaSelected = _selectedPaymentCategory == 'va';
    return Material(
      color: Colors.white,
      borderRadius: BorderRadius.circular(12),
      clipBehavior: Clip.antiAlias,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: isVaSelected ? const Color(0xff5746E7) : Colors.black12,
            width: isVaSelected ? 2 : 1,
          ),
        ),
        child: Column(
          children: [
            ListTile(
              onTap: () {
                setState(() {
                  _selectedPaymentCategory = 'va';
                  _isVaExpanded = !_isVaExpanded;
                });
              },
              leading: const Icon(Iconsax.bank, color: Color(0xff5746E7)),
              title: Text(
                _selectedBank ?? 'Virtual Account (Bank Transfer)',
                style: const TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w600,
                ),
              ),
              trailing: Icon(
                _isVaExpanded ? Iconsax.arrow_up_2 : Iconsax.arrow_down_1,
                size: 18,
              ),
            ),
            if (_isVaExpanded)
              Column(
                children: _bankList.map((bank) {
                  return RadioListTile<String>(
                    title: Text(
                      bank['name']!,
                      style: const TextStyle(fontSize: 12),
                    ),
                    value: bank['name']!,
                    groupValue: _selectedBank,
                    activeColor: const Color(0xff5746E7),
                    onChanged: (val) {
                      setState(() {
                        _selectedPaymentCategory = 'va';
                        _selectedBank = val;
                        _isVaExpanded = false;
                      });
                    },
                  );
                }).toList(),
              ),
          ],
        ),
      ),
    );
  }

  Widget _buildPriceDetails(int adminFee, int grandTotal) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Payment Details',
            style: TextStyle(fontSize: 14, fontWeight: FontWeight.w700),
          ),
          const SizedBox(height: 12),
          _rowPrice('Ticket Price', 'Rp ${widget.total}'),
          const SizedBox(height: 8),
          _rowPrice('Admin Fee', 'Rp $adminFee'),
          const Divider(height: 20),
          _rowPrice('Total Payment', 'Rp $grandTotal', isBold: true),
        ],
      ),
    );
  }

  Widget _rowPrice(String title, String price, {bool isBold = false}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: TextStyle(
            fontSize: 13,
            fontWeight: isBold ? FontWeight.w700 : FontWeight.w400,
          ),
        ),
        Text(
          price,
          style: TextStyle(
            fontSize: 13,
            fontWeight: isBold ? FontWeight.w700 : FontWeight.w400,
            color: isBold ? const Color(0xff5746E7) : Colors.black,
          ),
        ),
      ],
    );
  }
}

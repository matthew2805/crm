import 'package:flutter/material.dart';
import 'package:salesmanagementapp/Pages/Reviews/writereview.dart';

import '../../../Constants/colors.dart';
import '../../../Widgets/customapp_bar.dart';
import '../../../Widgets/custombtn.dart';
import '../../../Widgets/detailstext1.dart';

class Reviews extends StatelessWidget {
  const Reviews({super.key});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 13, vertical: 14),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 10),
                const CustomAppBar(text: 'Sales Reviews', text1: ''),
                const SizedBox(height: 20),
                const Center(
                  child: Text(
                    '4.5',
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.star, color: Colors.yellow.shade800),
                    Icon(Icons.star, color: Colors.yellow.shade800),
                    Icon(Icons.star, color: Colors.yellow.shade800),
                    Icon(Icons.star, color: Colors.yellow.shade800),
                    Icon(Icons.star_half, color: Colors.yellow.shade800),
                  ],
                ),
                const Center(
                  child: Text(
                    'based on travel Reviews',
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                const SizedBox(height: 25),
                RatingRow(
                  text: 'Excellent',
                  width: 160,
                  color: Colors.green.withOpacity(0.9),
                ),
                RatingRow(
                  text: 'Good',
                  width: 140,
                  color: Colors.lightGreen.withOpacity(0.9),
                ),
                RatingRow(
                  text: 'Average',
                  width: 100,
                  color: Colors.orange.shade800,
                ),
                const RatingRow(
                  text: 'Below Average',
                  width: 70,
                  color: Colors.purple,
                ),
                const RatingRow(
                  text: 'Poor',
                  width: 40,
                  color: Colors.red,
                ),
                const SizedBox(height: 20),
                const DeliveryReviewContainer(
                  image: 'images/c2.png',
                  text1: 'Alex Johnson',
                  text2: '4.8',
                  text3: '2 days ago',
                  reviewText:
                  'The booking was quick and smooth. My package arrived safely without any issues. Highly recommend!',
                ),
                const DeliveryReviewContainer(
                  image: 'images/c3.png',
                  text1: 'Sophia Lee',
                  text2: '4.0',
                  text3: '5 days ago',
                  reviewText:
                  'Good booking service, but there was a slight delay in arrival. Otherwise, everything went well.',
                ),
                const DeliveryReviewContainer(
                  image: 'images/c4.png',
                  text1: 'David Brown',
                  text2: '3.5',
                  text3: '1 week ago',
                  reviewText:
                  'The booking was okay, but the package was a little damaged. I hope this improves next time.',
                ),
                const DeliveryReviewContainer(
                  image: 'images/c5.png',
                  text1: 'Emily Davis',
                  text2: '5.0',
                  text3: '10 days ago',
                  reviewText:
                  'Amazing service! The courier was very friendly, and my package arrived much earlier than expected.',
                ),
                const DeliveryReviewContainer(
                  image: 'images/c2.png',
                  text1: 'Chris Lee',
                  text2: '2.0',
                  text3: '2 weeks ago',
                  reviewText:
                  'Disappointed with the service. The package arrived late and was in bad condition. Not recommended.',
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 15),
        child: CustomButton(
          text: 'Write A Review',
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => const WriteReviews()),
            );
          },
        ),
      ),
    );
  }
}

class DeliveryReviewContainer extends StatelessWidget {
  final String image;
  final String text1, text2, text3, reviewText;
  const DeliveryReviewContainer({
    super.key,
    required this.image,
    required this.text1,
    required this.text2,
    required this.text3,
    required this.reviewText,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(bottom: 8),
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: AppColors.textFormFieldBorderColor),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 2,
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(30),
                child: Image.asset(
                  image,
                  width: 40,
                  height: 40,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text1(text1: text1),
                    const SizedBox(height: 4),
                    Row(
                      children: [
                        Icon(Icons.star, color: Colors.yellow.shade800, size: 15),
                        Icon(Icons.star, color: Colors.yellow.shade800, size: 15),
                        Icon(Icons.star, color: Colors.yellow.shade800, size: 15),
                        Icon(Icons.star, color: Colors.yellow.shade800, size: 15),
                        Icon(Icons.star_half, color: Colors.yellow.shade800, size: 15),
                        const SizedBox(width: 5),
                        Text1(text1: text2),
                        const Spacer(),
                        Text1(text1: text3),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Text(
            reviewText,
            style: const TextStyle(),
          ),
        ],
      ),
    );
  }
}

class RatingRow extends StatelessWidget {
  final String text;
  final Color color;
  final double width;
  const RatingRow({
    super.key,
    required this.text,
    required this.color,
    required this.width,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          text,
          style: const TextStyle(
            fontSize: 13,
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(width: 30),
        Expanded(
          child: Container(
            height: 5,
            width: double.infinity,
            color: Colors.grey.shade300,
            child: Row(
              children: [
                Container(
                  height: 5,
                  width: width,
                  color: color,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

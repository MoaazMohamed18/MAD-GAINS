class OnboardingData {
  final String title;
  final String body;
  final String image;

  OnboardingData(this.title, this.body, this.image);

  static List<OnboardingData> onboardingPagesData = [
    OnboardingData(
        'Your Fitness Journey Simplified',
        'MadGains makes it easy for health and fitness enthusiasts to shop for the best supplements and stay on track with their fitness goals.',
        'assets/images/fitness.png'),
    OnboardingData(
        'Find the Best Supplements for You',
        "MadGains offers a wide selection of high-quality supplements, handpicked to meet your specific fitness needs.",
        'assets/images/weightlifter.png'),
    OnboardingData(
        'Get Supplements Tailored to You',
        'Receive personalized product recommendations based on your fitness goals and preferences.',
        'assets/images/protein.png'),
    OnboardingData(
        'Save Big with Exclusive Deals',
        'Enjoy exclusive offers and discounts on premium supplements when you shop with MadGains.',
        'assets/images/gift.png'),
    OnboardingData(
        'Achieve Your Goals with MadGains',
        'MadGains simplifies your supplement shopping, helping you stay fit and healthy. Get started today!',
        'assets/images/weightlifting.png'),
  ];
}

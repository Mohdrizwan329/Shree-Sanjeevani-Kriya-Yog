import 'package:flutter/material.dart';
import '../models/category_model.dart';
import '../models/service_model.dart';
import '../models/booking_model.dart';
import '../screens/auth/splash_screen.dart';
import '../screens/auth/onboarding_screen.dart';
import '../screens/auth/login_screen.dart';
import '../screens/auth/otp_screen.dart';
import '../screens/home/main_screen.dart';
import '../screens/search/search_screen.dart';
import '../screens/category/category_screen.dart';
import '../screens/service/service_detail_screen.dart';
import '../screens/booking/cart_screen.dart';
import '../screens/booking/checkout_screen.dart';
import '../screens/booking/booking_detail_screen.dart';
import '../screens/profile/edit_profile_screen.dart';
import '../screens/profile/wallet_screen.dart';
import '../screens/profile/addresses_screen.dart';
import '../screens/profile/refer_screen.dart';
import '../screens/notifications/notifications_screen.dart';
import '../screens/help/help_screen.dart';
import '../screens/membership/membership_screen.dart';

class AppRoutes {
  AppRoutes._();

  static const String splash = '/';
  static const String onboarding = '/onboarding';
  static const String login = '/login';
  static const String otp = '/otp';
  static const String main = '/main';
  static const String search = '/search';
  static const String category = '/category';
  static const String serviceDetail = '/service-detail';
  static const String cart = '/cart';
  static const String checkout = '/checkout';
  static const String bookingDetail = '/booking-detail';
  static const String editProfile = '/edit-profile';
  static const String wallet = '/wallet';
  static const String addresses = '/addresses';
  static const String refer = '/refer';
  static const String notifications = '/notifications';
  static const String help = '/help';
  static const String membership = '/membership';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case splash:
        return MaterialPageRoute(builder: (_) => const SplashScreen());
      case onboarding:
        return MaterialPageRoute(builder: (_) => const OnboardingScreen());
      case login:
        return MaterialPageRoute(builder: (_) => const LoginScreen());
      case otp:
        final phone = settings.arguments as String? ?? '';
        return MaterialPageRoute(builder: (_) => OtpScreen(phoneNumber: phone));
      case main:
        return MaterialPageRoute(builder: (_) => const MainScreen());
      case search:
        return MaterialPageRoute(builder: (_) => const SearchScreen());
      case category:
        final cat = settings.arguments as CategoryModel;
        return MaterialPageRoute(builder: (_) => CategoryScreen(category: cat));
      case serviceDetail:
        final service = settings.arguments as ServiceModel;
        return MaterialPageRoute(builder: (_) => ServiceDetailScreen(service: service));
      case cart:
        return MaterialPageRoute(builder: (_) => const CartScreen());
      case checkout:
        return MaterialPageRoute(builder: (_) => const CheckoutScreen());
      case bookingDetail:
        final booking = settings.arguments as BookingModel;
        return MaterialPageRoute(builder: (_) => BookingDetailScreen(booking: booking));
      case editProfile:
        return MaterialPageRoute(builder: (_) => const EditProfileScreen());
      case wallet:
        return MaterialPageRoute(builder: (_) => const WalletScreen());
      case addresses:
        return MaterialPageRoute(builder: (_) => const AddressesScreen());
      case refer:
        return MaterialPageRoute(builder: (_) => const ReferScreen());
      case notifications:
        return MaterialPageRoute(builder: (_) => const NotificationsScreen());
      case help:
        return MaterialPageRoute(builder: (_) => const HelpScreen());
      case membership:
        return MaterialPageRoute(builder: (_) => const MembershipScreen());
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(child: Text('No route defined for ${settings.name}')),
          ),
        );
    }
  }
}

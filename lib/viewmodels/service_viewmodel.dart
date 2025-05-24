import 'package:flutter/material.dart';
import '../models/service.dart';
import '../repositories/service_repository.dart';

class ServiceViewModel extends ChangeNotifier {
  final ServiceRepository _repository = ServiceRepository();
  List<Service> _services = [];
  bool _isLoading = false;
  String? _error;

  List<Service> get services => _services;
  bool get isLoading => _isLoading;
  String? get error => _error;

  ServiceViewModel() {
    fetchServices();
  }

  void fetchServices() async {
    _isLoading = true;
    notifyListeners();

    try {
      _repository.getServices().listen((services) {
        _services = services;
        _isLoading = false;
        _error = null;
        notifyListeners();
      });
    } catch (e) {
      _error = e.toString();
      _isLoading = false;
      notifyListeners();
    }
  }
}
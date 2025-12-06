import 'package:eventaty/models/event_model.dart';
import 'package:flutter/foundation.dart';

/// ViewModel for Home screen
class HomeViewModel extends ChangeNotifier {
  List<EventModel> _allEvents = [];
  List<EventModel> _filteredEvents = [];
  String _selectedFilter = 'All';

  List<EventModel> get filteredEvents => _filteredEvents;
  String get selectedFilter => _selectedFilter;

  void initialize() {
    _allEvents = [
      EventModel(
        id: '1',
        title: 'Tech Conference 2025',
        description: 'Annual tech conference',
        imagePath: 'assets/event1.png',
        day: '15',
        month: 'Jan',
        category: 'Technology',
        dateTime: DateTime(2025, 1, 15),
        location: 'Convention Center',
      ),
      EventModel(
        id: '2',
        title: 'Sports Championship',
        description: 'Regional sports event',
        imagePath: 'assets/event2.png',
        day: '20',
        month: 'Feb',
        category: 'Sports',
        dateTime: DateTime(2025, 2, 20),
        location: 'Sports Stadium',
      ),
    ];
    _filteredEvents = List.from(_allEvents);
    notifyListeners();
  }

  void filterByCategory(String category) {
    _selectedFilter = category;
    if (category == 'All') {
      _filteredEvents = List.from(_allEvents);
    } else {
      _filteredEvents = _allEvents
          .where((event) => event.category == category)
          .toList();
    }
    notifyListeners();
  }

  void toggleEventAttendance(String eventId) {
    final index = _filteredEvents.indexWhere((event) => event.id == eventId);
    if (index != -1) {
      _filteredEvents[index] = _filteredEvents[index].copyWith(
        isAttending: !_filteredEvents[index].isAttending,
      );
      notifyListeners();
    }
  }

  EventModel? getEventById(String eventId) {
    try {
      return _allEvents.firstWhere((event) => event.id == eventId);
    } catch (e) {
      return null;
    }
  }

  List<EventModel> getAttendingEvents() {
    return _filteredEvents.where((event) => event.isAttending).toList();
  }
}

abstract class SyncState {}

class InitialState extends SyncState {}

class ProgressSyncState extends SyncState {}

class SynchronizedState extends SyncState {}

class CompletedSyncState extends SyncState {}

class ErrorSyncState extends SyncState {}

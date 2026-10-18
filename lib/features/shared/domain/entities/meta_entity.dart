class MetaEntity {
  final int total;
  final int limit;
  final int offset;
  final bool hasMore;

  const MetaEntity({
    required this.total,
    required this.limit,
    required this.offset,
    required this.hasMore,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MetaEntity &&
          runtimeType == other.runtimeType &&
          total == other.total &&
          limit == other.limit &&
          offset == other.offset &&
          hasMore == other.hasMore;

  @override
  int get hashCode =>
      total.hashCode ^ limit.hashCode ^ offset.hashCode ^ hasMore.hashCode;

  @override
  String toString() =>
      'MetaEntity(total: $total, limit: $limit, offset: $offset, hasMore: $hasMore)';
}

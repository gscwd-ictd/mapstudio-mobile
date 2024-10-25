enum SacoStatus {
  newapplication('New'),
  inprogress('In Progress'),
  forwarded('Forwarded'),
  returned('Returned'),
  completed('Completed');

  final String value;
  const SacoStatus(this.value);
}

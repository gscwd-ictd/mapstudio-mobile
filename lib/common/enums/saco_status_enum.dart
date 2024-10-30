enum SacoStatus {
  newapplication('New'),
  inprogress('In Progress'),
  forwarded('Forwarded'),
  returned('Returned'),
  completed('Completed'),
  all('All');

  final String value;
  const SacoStatus(this.value);
}

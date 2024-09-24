enum MapLayer {
  defaultosm('osm'),
  lightmode('lightmode'),
  darkmode('darkmode'),
  pipelines('Pipeline2024_6'),
  firehydrants('HYDRANTS2024'),
  watermeters('WM2024_4');

  final String value;
  const MapLayer(this.value);
}

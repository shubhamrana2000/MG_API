function truncateString(str, num) {
  if (str.length <= num) {
    return str;
  }
  return str.split(' ').slice(0, num).join(' ') + '...';
}

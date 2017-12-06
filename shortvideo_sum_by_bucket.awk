#!/usr/bin/awk -f
BEGIN {
	FS="\t";
  OFS="\t";
	split("op\top_a\top_b\top_c", buckets);
}

{
  for (i in buckets) {
    if ($8 == buckets[i]) {
      pv[i] += $9;
      click[i] += $10;
    }
  }
}

END {
  for (i in buckets) {
    print buckets[i], click[i] / pv[i];
  }
}


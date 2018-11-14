DROP TABLE bountys;

CREATE TABLE bountys (
  id SERIAL4 PRIMARY KEY,
  name VARCHAR(255),
  bounty_value INT8,
  collected_by VARCHAR(255)
);

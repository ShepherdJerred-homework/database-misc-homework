CREATE TABLE colleges (
  college_id INT PRIMARY KEY IDENTITY,
  name       VARCHAR(128) NOT NULL
);

CREATE TABLE departments (
  department_id INT PRIMARY KEY IDENTITY,
  name          VARCHAR(128) NOT NULL,
  college_id    INT          NOT NULL,
  FOREIGN KEY (college_id) REFERENCES colleges (college_id)
);

CREATE TABLE investigators (
  investigator_id           INT PRIMARY KEY IDENTITY,
  first_name                NVARCHAR(128) NOT NULL,
  last_name                 NVARCHAR(128) NOT NULL,
  email                     VARCHAR(255)  NOT NULL,
  phone                     VARCHAR(18)   NOT NULL,
  alternate_phone           VARCHAR(18),
  fax                       VARCHAR(18),
  department_id             INT           NOT NULL,
  last_financial_disclosure DATE          NOT NULL,
  last_FCOI_training        DATE          NOT NULL,
  FOREIGN KEY (department_id) REFERENCES departments (department_id)
);

CREATE TABLE sponsors (
  sponsor_id     INT PRIMARY KEY IDENTITY,
  name           VARCHAR(128) NOT NULL,
  address_line_1 VARCHAR(64)  NOT NULL,
  address_line_2 VARCHAR(64),
  address_city   CHAR(64)     NOT NULL,
  address_state  VARCHAR(2)   NOT NULL,
  address_zip    CHAR(5)      NOT NULL,
  phone          VARCHAR(18)  NOT NULL,
  email          VARCHAR(255) NOT NULL
);

CREATE TABLE proposal_types (
  type_id INT PRIMARY KEY IDENTITY,
  name    VARCHAR(128) NOT NULL UNIQUE
);

CREATE TABLE activities (
  activity_id INT PRIMARY KEY IDENTITY,
  name        VARCHAR(128) NOT NULL UNIQUE
);

CREATE TABLE submission_methods (
  method_id INT PRIMARY KEY  IDENTITY,
  name      VARCHAR(128) NOT NULL UNIQUE
);


CREATE TABLE proposals (
  proposal_id             INT PRIMARY KEY IDENTITY,
  name                    VARCHAR(128) NOT NULL,
  activity_id             INT          NOT NULL,
  type_id                 INT          NOT NULL,
  method_id               INT          NOT NULL,
  cfda                    VARCHAR(32)  NOT NULL,
  due_date                DATE         NOT NULL,
  sponsor_id              INT          NOT NULL,
  primary_investigator_id INT          NOT NULL,
  ip_or_patents           BIT          NOT NULL,
  human_subjects          BIT          NOT NULL,
  itar                    BIT          NOT NULL,
  fetal_tissue            BIT          NOT NULL,
  outside_tech            BIT          NOT NULL,
  misconduct_policy       BIT          NOT NULL,
  relatives               BIT          NOT NULL,
  FOREIGN KEY (activity_id) REFERENCES activities (activity_id),
  FOREIGN KEY (type_id) REFERENCES proposal_types (type_id),
  FOREIGN KEY (method_id) REFERENCES submission_methods (method_id),
  FOREIGN KEY (sponsor_id) REFERENCES sponsors (sponsor_id),
  FOREIGN KEY (primary_investigator_id) REFERENCES investigators (investigator_id)
);

CREATE TABLE awards (
  original_proposal_id    INT PRIMARY KEY,
  name                    VARCHAR(128) NOT NULL,
  activity_id             INT          NOT NULL,
  type_id                 INT          NOT NULL,
  method_id               INT          NOT NULL,
  cfda                    VARCHAR(32)  NOT NULL,
  due_date                DATE         NOT NULL,
  sponsor_id              INT          NOT NULL,
  primary_investigator_id INT          NOT NULL,
  ip_or_patents           BIT          NOT NULL,
  human_subjects          BIT          NOT NULL,
  itar                    BIT          NOT NULL,
  fetal_tissue            BIT          NOT NULL,
  outside_tech            BIT          NOT NULL,
  misconduct_policy       BIT          NOT NULL,
  relatives               BIT          NOT NULL,
  FOREIGN KEY (activity_id) REFERENCES activities (activity_id),
  FOREIGN KEY (type_id) REFERENCES proposal_types (type_id),
  FOREIGN KEY (method_id) REFERENCES submission_methods (method_id),
  FOREIGN KEY (sponsor_id) REFERENCES sponsors (sponsor_id),
  FOREIGN KEY (primary_investigator_id) REFERENCES investigators (investigator_id),
  FOREIGN KEY (original_proposal_id) REFERENCES proposals (proposal_id)
);

CREATE TABLE budgets (
  proposal_id        INT,
  begin_date         DATE NOT NULL,
  end_date           DATE NOT NULL,
  salaries           DECIMAL(32, 4),
  other_direct_costs DECIMAL(32, 4),
  fa_costs           DECIMAL(32, 4),
  sponsor_costs      DECIMAL(32, 4),
  FOREIGN KEY (proposal_id) REFERENCES proposals (proposal_id)
);

--  TODO Use correct types
CREATE TABLE cost_sharing (
  proposal_id INT,
  source      VARCHAR(64),
  type        VARCHAR(64),
  FOREIGN KEY (proposal_id) REFERENCES proposals (proposal_id)
);

CREATE TABLE proposal_co_investigators (
  proposal_id     INT NOT NULL,
  investigator_id INT NOT NULL,
  FOREIGN KEY (proposal_id) REFERENCES proposals (proposal_id),
  FOREIGN KEY (investigator_id) REFERENCES investigators (investigator_id),
  PRIMARY KEY (proposal_id, investigator_id)
);

CREATE TABLE regulatory_types (
  regulatory_id INT PRIMARY KEY IDENTITY,
  name          VARCHAR(32) UNIQUE
);

CREATE TABLE proposal_regulatory (
  proposal_id     INT         NOT NULL,
  regulatory_id   INT         NOT NULL,
  is_approved     BIT         NOT NULL,
  approval_date   DATE        NOT NULL,
  protocol_number VARCHAR(32) NOT NULL,
  PRIMARY KEY (proposal_id, regulatory_id),
  FOREIGN KEY (proposal_id) REFERENCES proposals (proposal_id),
  FOREIGN KEY (regulatory_id) REFERENCES regulatory_types (regulatory_id)
);

CREATE TABLE subawardees (
  proposal_id      INT PRIMARY KEY,
  institution_name VARCHAR(128)  NOT NULL,
  contact_name     NVARCHAR(256) NOT NULL,
  contact_email    VARCHAR(255)  NOT NULL,
  FOREIGN KEY (proposal_id) REFERENCES proposals (proposal_id)
);

CREATE TABLE facilities_distribution (
  proposal_id     INT,
  investigator_id INT,
  percentage      FLOAT,
  PRIMARY KEY (proposal_id, investigator_id),
  FOREIGN KEY (proposal_id) REFERENCES proposals (proposal_id),
  FOREIGN KEY (investigator_id) REFERENCES investigators (investigator_id)
);

CREATE TABLE investigator_signatures (
  proposal_id            INT,
  investigator_id        INT,
  investigator_sign_date DATE,
  chair_sign_date        DATE,
  dean_sign_date         DATE,
  PRIMARY KEY (proposal_id, investigator_id),
  FOREIGN KEY (proposal_id) REFERENCES proposals (proposal_id),
  FOREIGN KEY (investigator_id) REFERENCES investigators (investigator_id)
);

--  Can be merged into proposals
CREATE TABLE administrative_signatures (
  proposal_id       INT PRIMARY KEY,
  office_sign_date  DATE,
  provost_sign_date DATE,
  FOREIGN KEY (proposal_id) REFERENCES proposals (proposal_id)
);

INSERT INTO proposal_types VALUES ('New proposal');
INSERT INTO proposal_types VALUES ('Pre-proposal');
INSERT INTO proposal_types VALUES ('Renewal');
INSERT INTO proposal_types VALUES ('Supplement');

INSERT INTO activities VALUES ('Research');
INSERT INTO activities VALUES ('Training');
INSERT INTO activities VALUES ('Outreach');
INSERT INTO activities VALUES ('Equipment');
INSERT INTO activities VALUES ('Other');

INSERT INTO submission_methods VALUES ('Paper');
INSERT INTO submission_methods VALUES ('Grants.gov');
INSERT INTO submission_methods VALUES ('Fastlane');

INSERT INTO regulatory_types VALUES ('Human Subjects');
INSERT INTO regulatory_types VALUES ('Live Animals');
INSERT INTO regulatory_types VALUES ('Pathogens');

INSERT INTO colleges VALUES ('Business');
INSERT INTO colleges VALUES ('Science');
INSERT INTO colleges VALUES ('Medicine');

INSERT INTO departments VALUES ('Marketing', 1);
INSERT INTO departments VALUES ('Computer Science', 2);
INSERT INTO departments VALUES ('Engineering', 2);
INSERT INTO departments VALUES ('Nursing', 3);

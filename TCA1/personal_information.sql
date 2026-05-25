CREATE TABLE personal_information (
    p_id            VARCHAR2(10) PRIMARY KEY,
    f_name          VARCHAR2(50),
    m_name          VARCHAR2(50),
    l_name          VARCHAR2(50),
    date_of_birth   DATE,
    nationality     VARCHAR2(30),
    ethnicity       VARCHAR2(30),
    religion        VARCHAR2(30)
);

CREATE TABLE body_characters (
    bc_id        VARCHAR2(10) PRIMARY KEY,
    p_id         VARCHAR2(10),
    height       NUMBER(5,2),
    weight       NUMBER(5,2),
    blood_group  VARCHAR2(5),
    skin_color   VARCHAR2(20),
    hair_color   VARCHAR2(20),
    eye_color    VARCHAR2(20),   
    FOREIGN KEY (p_id) REFERENCES personal_information(p_id)
);

CREATE TABLE financial (
    fin_id   VARCHAR2(10) PRIMARY KEY,
    p_id     VARCHAR2(10),
    FOREIGN KEY (p_id) REFERENCES personal_information(p_id)
);

CREATE TABLE income (
    i_id         VARCHAR2(10) PRIMARY KEY,
    fin_id       VARCHAR2(10),
    source       VARCHAR2(50),
    amount       NUMBER(10,2),
    income_date  DATE,
    FOREIGN KEY (fin_id) REFERENCES financial(fin_id)
);

CREATE TABLE expenses (
    e_id          VARCHAR2(10) PRIMARY KEY,
    fin_id        VARCHAR2(10),
    category      VARCHAR2(30),
    amount        NUMBER(10,2),
    expense_date  DATE,
    FOREIGN KEY (fin_id) REFERENCES financial(fin_id)
);

CREATE TABLE bank_details (
    account_no    VARCHAR2(16) PRIMARY KEY,
    fin_id        VARCHAR2(10),
    account_type  VARCHAR2(20),
    branch        VARCHAR2(50),
    amount        NUMBER(10,2),
    FOREIGN KEY (fin_id) REFERENCES financial(fin_id)
);

CREATE TABLE background (
    bg_id   VARCHAR2(10) PRIMARY KEY,
    p_id    VARCHAR2(10),
    FOREIGN KEY (p_id) REFERENCES personal_information(p_id)
);

CREATE TABLE academics (
    a_id           VARCHAR2(10) PRIMARY KEY,
    bg_id          VARCHAR2(10),
    degree         VARCHAR2(50),
    institute      VARCHAR2(50),
    starting_date  DATE,
    leaving_date   DATE,
    FOREIGN KEY (bg_id) REFERENCES background(bg_id)
);

CREATE TABLE job_experience (
    j_id           VARCHAR2(10) PRIMARY KEY,
    bg_id          VARCHAR2(10),
    company        VARCHAR2(50),
    position       VARCHAR2(50),
    starting_date  DATE,
    leaving_date   DATE,
    FOREIGN KEY (bg_id) REFERENCES background(bg_id)
);

CREATE TABLE legal_history (
    l_id           VARCHAR2(10) PRIMARY KEY,
    bg_id          VARCHAR2(10),
    case_title     VARCHAR2(100),
    case_date      DATE,
    consequences   VARCHAR2(200),
    final_verdict  VARCHAR2(200),
    FOREIGN KEY (bg_id) REFERENCES background(bg_id)
);

CREATE TABLE medical_history (
    mh_id            VARCHAR2(10) PRIMARY KEY,
    p_id             VARCHAR2(10),
    chief_complaint  VARCHAR2(200),
    visit_date       DATE,
    hospital         VARCHAR2(50),
    doctor           VARCHAR2(50),
    prescription     VARCHAR2(200),
    FOREIGN KEY (p_id) REFERENCES personal_information(p_id)
);

CREATE TABLE personal_details (
    pd_id   VARCHAR2(10) PRIMARY KEY,
    p_id    VARCHAR2(10),
    FOREIGN KEY (p_id) REFERENCES personal_information(p_id)
);

CREATE TABLE address (
    add_id        VARCHAR2(10) PRIMARY KEY,
    pd_id         VARCHAR2(10),
    type          VARCHAR2(20),
    province      VARCHAR2(30),
    district      VARCHAR2(30),
    municipality  VARCHAR2(30),
    ward_no       NUMBER(5),
    street        VARCHAR2(50),
    FOREIGN KEY (pd_id) REFERENCES personal_details(pd_id)
);

CREATE TABLE contact_details (
    c_id          VARCHAR2(10) PRIMARY KEY,
    pd_id         VARCHAR2(10),
    phone         VARCHAR2(15),
    email         VARCHAR2(50),
    social_media  VARCHAR2(50),
    post_no       VARCHAR2(10),
    fax_no        VARCHAR2(15),
    FOREIGN KEY (pd_id) REFERENCES personal_details(pd_id)
);

CREATE TABLE family_details (
    fam_id    VARCHAR2(10) PRIMARY KEY,
    pd_id     VARCHAR2(10),
    name      VARCHAR2(50),
    relation  VARCHAR2(30),
    FOREIGN KEY (pd_id) REFERENCES personal_details(pd_id)
);


CREATE TABLE documents (
    registration_no  VARCHAR2(20) PRIMARY KEY,
    p_id             VARCHAR2(10),
    document_name    VARCHAR2(50),
    issue_location   VARCHAR2(50),
    issue_date       DATE,
    expiry_date      DATE,
    FOREIGN KEY (p_id) REFERENCES personal_information(p_id)
);


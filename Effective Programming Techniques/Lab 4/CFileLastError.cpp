//
// Created by Khalid on 19/11/2022.
//


#include "CFileLastError.h"
#include <cstdio>

bool CFileLastError::b_last_error = false;

CFileLastError::CFileLastError() { pf_file = NULL; }

CFileLastError::CFileLastError(string FileName) {
    vOpenFile(FileName);
}

CFileLastError::~CFileLastError() {
    if (pf_file != NULL) {
        fclose(pf_file);
    }
}

void CFileLastError::vOpenFile(string FileName) {
    b_last_error = false;

    if (pf_file != NULL) {
        b_last_error = true;
        return;
    }

    pf_file = fopen(FileName.c_str(), "a+");

    if (pf_file == NULL) {
        b_last_error = true;
        return;
    }
}

void CFileLastError::vCloseFile() {
    b_last_error = false;

    if (pf_file == NULL) {
        b_last_error = true;
        return;
    }

    fclose(pf_file);
}

void CFileLastError::vPrintLine(string sText) {
    b_last_error = false;

    if (pf_file == NULL) {
        b_last_error = true;
        return;
    }

    fprintf(pf_file, "%s\n", sText.c_str());
}

void CFileLastError::vPrintManyLines(vector<string> sText) {
    b_last_error = false;

    if (pf_file == NULL) {
        b_last_error = true;
        return;
    }

    for (int i = 0; i < sText.size(); i++)
    {
        fprintf(pf_file, "%s\n", sText[i].c_str());
    }
}
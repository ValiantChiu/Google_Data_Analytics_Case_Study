{
 "cells": [
  {
   "cell_type": "markdown",
   "id": "87e53eb0",
   "metadata": {
    "papermill": {
     "duration": 0.004151,
     "end_time": "2022-11-27T11:31:35.700500",
     "exception": false,
     "start_time": "2022-11-27T11:31:35.696349",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "# Import necessary packages"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 1,
   "id": "c0db9964",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2022-11-27T11:31:35.712717Z",
     "iopub.status.busy": "2022-11-27T11:31:35.709196Z",
     "iopub.status.idle": "2022-11-27T11:31:37.367913Z",
     "shell.execute_reply": "2022-11-27T11:31:37.365614Z"
    },
    "papermill": {
     "duration": 1.667493,
     "end_time": "2022-11-27T11:31:37.370764",
     "exception": false,
     "start_time": "2022-11-27T11:31:35.703271",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "name": "stderr",
     "output_type": "stream",
     "text": [
      "── \u001b[1mAttaching packages\u001b[22m ─────────────────────────────────────── tidyverse 1.3.2 ──\n",
      "\u001b[32m✔\u001b[39m \u001b[34mggplot2\u001b[39m 3.3.6      \u001b[32m✔\u001b[39m \u001b[34mpurrr  \u001b[39m 0.3.5 \n",
      "\u001b[32m✔\u001b[39m \u001b[34mtibble \u001b[39m 3.1.8      \u001b[32m✔\u001b[39m \u001b[34mdplyr  \u001b[39m 1.0.10\n",
      "\u001b[32m✔\u001b[39m \u001b[34mtidyr  \u001b[39m 1.2.1      \u001b[32m✔\u001b[39m \u001b[34mstringr\u001b[39m 1.4.1 \n",
      "\u001b[32m✔\u001b[39m \u001b[34mreadr  \u001b[39m 2.1.3      \u001b[32m✔\u001b[39m \u001b[34mforcats\u001b[39m 0.5.2 \n",
      "── \u001b[1mConflicts\u001b[22m ────────────────────────────────────────── tidyverse_conflicts() ──\n",
      "\u001b[31m✖\u001b[39m \u001b[34mdplyr\u001b[39m::\u001b[32mfilter()\u001b[39m masks \u001b[34mstats\u001b[39m::filter()\n",
      "\u001b[31m✖\u001b[39m \u001b[34mdplyr\u001b[39m::\u001b[32mlag()\u001b[39m    masks \u001b[34mstats\u001b[39m::lag()\n",
      "\n",
      "Attaching package: ‘lubridate’\n",
      "\n",
      "\n",
      "The following objects are masked from ‘package:base’:\n",
      "\n",
      "    date, intersect, setdiff, union\n",
      "\n",
      "\n"
     ]
    }
   ],
   "source": [
    "library(tidyverse)\n",
    "library(lubridate)"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "d74fce1f",
   "metadata": {
    "papermill": {
     "duration": 0.003336,
     "end_time": "2022-11-27T11:31:37.377074",
     "exception": false,
     "start_time": "2022-11-27T11:31:37.373738",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "# Date Prepare and Process"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "06c8778a",
   "metadata": {
    "papermill": {
     "duration": 0.002872,
     "end_time": "2022-11-27T11:31:37.382710",
     "exception": false,
     "start_time": "2022-11-27T11:31:37.379838",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "## Import Data"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 2,
   "id": "f47130d9",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2022-11-27T11:31:37.424184Z",
     "iopub.status.busy": "2022-11-27T11:31:37.390652Z",
     "iopub.status.idle": "2022-11-27T11:34:49.691920Z",
     "shell.execute_reply": "2022-11-27T11:34:49.689285Z"
    },
    "papermill": {
     "duration": 192.310423,
     "end_time": "2022-11-27T11:34:49.696130",
     "exception": false,
     "start_time": "2022-11-27T11:31:37.385707",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [],
   "source": [
    "data <- read.csv('../input/bike-share-data/bike_share_data_complete_with_season.csv')"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 3,
   "id": "21282720",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2022-11-27T11:34:49.715188Z",
     "iopub.status.busy": "2022-11-27T11:34:49.713040Z",
     "iopub.status.idle": "2022-11-27T11:34:49.766272Z",
     "shell.execute_reply": "2022-11-27T11:34:49.760833Z"
    },
    "papermill": {
     "duration": 0.069986,
     "end_time": "2022-11-27T11:34:49.770890",
     "exception": false,
     "start_time": "2022-11-27T11:34:49.700904",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "name": "stdout",
     "output_type": "stream",
     "text": [
      "Rows: 4,593,627\n",
      "Columns: 15\n",
      "$ X                  \u001b[3m\u001b[90m<int>\u001b[39m\u001b[23m 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, …\n",
      "$ ride_id            \u001b[3m\u001b[90m<chr>\u001b[39m\u001b[23m \"614B15BC42810184\", \"ADCC6E3CF9C04688\", \"6184CC5724…\n",
      "$ rideable_type      \u001b[3m\u001b[90m<chr>\u001b[39m\u001b[23m \"docked_bike\", \"classic_bike\", \"docked_bike\", \"dock…\n",
      "$ started_at         \u001b[3m\u001b[90m<chr>\u001b[39m\u001b[23m \"2021-10-05 10:56:05\", \"2021-10-06 13:55:33\", \"2021…\n",
      "$ ended_at           \u001b[3m\u001b[90m<chr>\u001b[39m\u001b[23m \"2021-10-05 11:38:48\", \"2021-10-06 13:58:16\", \"2021…\n",
      "$ start_station_name \u001b[3m\u001b[90m<chr>\u001b[39m\u001b[23m \"Michigan Ave & Oak St\", \"Desplaines St & Kinzie St…\n",
      "$ start_station_id   \u001b[3m\u001b[90m<chr>\u001b[39m\u001b[23m \"13042\", \"TA1306000003\", \"13042\", \"13042\", \"KA15030…\n",
      "$ end_station_name   \u001b[3m\u001b[90m<chr>\u001b[39m\u001b[23m \"Michigan Ave & Oak St\", \"Kingsbury St & Kinzie St\"…\n",
      "$ end_station_id     \u001b[3m\u001b[90m<chr>\u001b[39m\u001b[23m \"13042\", \"KA1503000043\", \"13042\", \"13042\", \"TA13060…\n",
      "$ start_lat          \u001b[3m\u001b[90m<dbl>\u001b[39m\u001b[23m 41.90096, 41.88872, 41.90096, 41.90096, 41.88918, 4…\n",
      "$ start_lng          \u001b[3m\u001b[90m<dbl>\u001b[39m\u001b[23m -87.62378, -87.64445, -87.62378, -87.62378, -87.638…\n",
      "$ end_lat            \u001b[3m\u001b[90m<dbl>\u001b[39m\u001b[23m 41.90096, 41.88918, 41.90096, 41.90096, 41.88872, 4…\n",
      "$ end_lng            \u001b[3m\u001b[90m<dbl>\u001b[39m\u001b[23m -87.62378, -87.63851, -87.62378, -87.62378, -87.644…\n",
      "$ member_casual      \u001b[3m\u001b[90m<chr>\u001b[39m\u001b[23m \"casual\", \"member\", \"casual\", \"casual\", \"member\", \"…\n",
      "$ season             \u001b[3m\u001b[90m<int>\u001b[39m\u001b[23m 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, …\n"
     ]
    }
   ],
   "source": [
    "glimpse(data)"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "6941faa0",
   "metadata": {
    "papermill": {
     "duration": 0.003263,
     "end_time": "2022-11-27T11:34:49.777536",
     "exception": false,
     "start_time": "2022-11-27T11:34:49.774273",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "## Prepare and Process Data"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 4,
   "id": "8e2e0643",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2022-11-27T11:34:49.789118Z",
     "iopub.status.busy": "2022-11-27T11:34:49.786858Z",
     "iopub.status.idle": "2022-11-27T11:35:57.481921Z",
     "shell.execute_reply": "2022-11-27T11:35:57.479510Z"
    },
    "papermill": {
     "duration": 67.704433,
     "end_time": "2022-11-27T11:35:57.485255",
     "exception": false,
     "start_time": "2022-11-27T11:34:49.780822",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [],
   "source": [
    "data <- data %>% \n",
    "  mutate(ride_length = as.POSIXct(ended_at)  - as.POSIXct(started_at), day_of_week = wday(as.POSIXct(started_at) )) \n"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": null,
   "id": "938fa2a0",
   "metadata": {
    "papermill": {
     "duration": 0.003336,
     "end_time": "2022-11-27T11:35:57.493443",
     "exception": false,
     "start_time": "2022-11-27T11:35:57.490107",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [],
   "source": []
  }
 ],
 "metadata": {
  "kernelspec": {
   "display_name": "R",
   "language": "R",
   "name": "ir"
  },
  "language_info": {
   "codemirror_mode": "r",
   "file_extension": ".r",
   "mimetype": "text/x-r-source",
   "name": "R",
   "pygments_lexer": "r",
   "version": "4.0.5"
  },
  "papermill": {
   "default_parameters": {},
   "duration": 266.226336,
   "end_time": "2022-11-27T11:35:57.821304",
   "environment_variables": {},
   "exception": null,
   "input_path": "__notebook__.ipynb",
   "output_path": "__notebook__.ipynb",
   "parameters": {},
   "start_time": "2022-11-27T11:31:31.594968",
   "version": "2.4.0"
  }
 },
 "nbformat": 4,
 "nbformat_minor": 5
}

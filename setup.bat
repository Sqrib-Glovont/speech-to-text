@echo off

REM Check if the virtual environment directory exists
if not exist .venv-STT (
    echo Creating virtual environment with Python 3.9...
    python3.9 -m venv .venv-STT

    REM Activate the virtual environment
    echo Activating virtual environment...
    call .\.venv-STT\Scripts\activate

    REM Upgrade pip
    echo Upgrading pip...
    .\.venv-STT\Scripts\pip install --upgrade pip

    REM Install ipykernel
    echo Installing ipykernel...
    .\.venv-STT\Scripts\pip install ipykernel
) else (
    REM Activate the virtual environment
    echo Activating virtual environment...
    call .\.venv-STT\Scripts\activate
)

REM Install PyTorch and Torchaudio
echo Installing PyTorch and Torchaudio...
.\.venv-STT\Scripts\pip install torch==2.2.2+cu121 torchaudio==2.2.2+cu121 --index-url https://download.pytorch.org/whl/cu121

REM Install other requirements
echo Installing requirements from requirements.txt...
.\.venv-STT\Scripts\pip install -r requirements.txt

echo Setup complete.
pause
